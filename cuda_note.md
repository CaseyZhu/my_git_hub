<https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html>  
<https://team.inria.fr/pacap/members/collange/>

# thread block 
There is a limit to the number of threads per block, since all threads of a block are expected to reside on the same streaming multiprocessor core and must share the limited memory resources of that core. On current GPUs, a thread block may contain up to 1024 threads.

Blocks are organized into a one-dimensional, two-dimensional, or three-dimensional grid of thread blocks . The number of thread blocks in a grid is usually dictated by the size of the data being processed, which typically exceeds the number of processors in the system.

# Grid of Thread Blocks.

The number of threads per block and the number of blocks per grid specified in the <<<...>>> syntax can be of type int or dim3. Two-dimensional blocks or grids can be specified as in the example above.

Each block within the grid can be identified by a one-dimensional, two-dimensional, or three-dimensional unique index accessible within the kernel through the built-in blockIdx variable. The dimension of the thread block is accessible within the kernel through the built-in blockDim variable.

# Thread Block Clusters
With the introduction of NVIDIA Compute Capability 9.0, the CUDA programming model introduces an optional level of hierarchy called Thread Block Clusters that are made up of thread blocks. Similar to how threads in a thread block are guaranteed to be co-scheduled on a streaming multiprocessor, thread blocks in a cluster are also guaranteed to be co-scheduled on a GPU Processing Cluster (GPC) in the GPU.

Similar to thread blocks, clusters are also organized into a one-dimension, two-dimension, or three-dimension as illustrated by Figure 5. The number of thread blocks in a cluster can be user-defined, and a maximum of 8 thread blocks in a cluster is supported as a portable cluster size in CUDA. Having a thread block cluster size beyond 8 is architecture-specific and can be queried using the cudaOccupancyMaxPotentialClusterSize API.

In GPUs with compute capability 9.0, all the thread blocks in the cluster are guaranteed to be co-scheduled on a single GPU Processing Cluster (GPC) and allow thread blocks in the cluster to perform hardware-supported synchronization using the Cluster Group API **cluster.sync()**.

Thread blocks that belong to a cluster have access to the **Distributed Shared Memory**. Thread blocks in a cluster have the ability to read, write, and perform atomics to any address in the distributed shared memory. Distributed Shared Memory gives an example of performing histograms in distributed shared memory.

# sync in block
Threads within a block can cooperate by sharing data through some shared memory and by synchronizing their execution to coordinate memory accesses. More precisely, one can specify synchronization points in the kernel by calling the __syncthreads() intrinsic function; __syncthreads() acts as a barrier at which all threads in the block must wait before any is allowed to proceed. Shared Memory gives an example of using shared memory. In addition to __syncthreads(), the Cooperative Groups API provides a rich set of thread-synchronization primitives.

# sync between blocks

Those wait one block done task can use atomic operation. Others needs write multiple kernel.

# memory hierarchy
CUDA threads may access data from multiple memory spaces during their execution as illustrated by Figure 6. Each thread has private local memory. Each thread block has shared memory visible to all threads of the block and with the same lifetime as the block. Thread blocks in a thread block cluster can perform read, write, and atomics operations on each other's shared memory. All threads have access to the same global memory.

There are also two additional read-only memory spaces accessible by all threads: the constant and texture memory spaces. The global, constant, and texture memory spaces are optimized for different memory usages (see Device Memory Accesses). Texture memory also offers different addressing modes, as well as data filtering, for some specific data formats (see Texture and Surface Memory).

The global, constant, and texture memory spaces are persistent across kernel launches by the same application.  

![hierarchy](https://docs.nvidia.com/cuda/cuda-c-programming-guide/graphics/memory-hierarchy.png)

# Asynchronous Operations
An asynchronous operation is defined as an operation that is initiated by a CUDA thread and is executed asynchronously as-if by another thread. In a well formed program one or more CUDA threads synchronize with the asynchronous operation. **The CUDA thread that initiated the asynchronous operation is not required to be among the synchronizing threads.** async copy 应该是一条per-thread的粗粒度指令，这样才能尽可能的实现访存和计算并行，细粒度指令会影响计算指令下发。

# Host GPU unify memory（虚拟地址）实现
1. CPU 分配存储空间
2. CPU 对存储空间操作
3. GPU 对存储空间操作时报异常
4. copy cpu 空间的数据到GPU,回收cpu memory
5. GPU 修改内存数据
6. cpu 访问时报缺页异常，从gpu 把数据copy 会cpu,回收gpu 存储的数据

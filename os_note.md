# 真实计算机的加电启动流程

真实计算机的启动流程大致上也可以分为三个阶段：

* 第一阶段：加电后 CPU 的 PC 寄存器被设置为计算机内部只读存储器（ROM，Read-only Memory）的物理地址，随后 CPU 开始运行 ROM 内的软件。我们一般将该软件称为固件（Firmware），它的功能是对 CPU 进行一些初始化操作，将后续阶段的 bootloader 的代码、数据从硬盘载入到物理内存，最后跳转到适当的地址将计算机控制权转移给 bootloader 。它大致对应于 Qemu 启动的第一阶段，即在物理地址 0x1000 处放置的若干条指令。可以看到 Qemu 上的固件非常简单，因为它并不需要负责将 bootloader 从硬盘加载到物理内存中，这个任务此前已经由 Qemu 自身完成了。

* 第二阶段：bootloader 同样完成一些 CPU 的初始化工作，将操作系统镜像从硬盘加载到物理内存中，最后跳转到适当地址将控制权转移给操作系统。可以看到一般情况下 bootloader 需要完成一些数据加载工作，这也就是它名字中 loader 的来源。它对应于 Qemu 启动的第二阶段。在 Qemu 中，我们使用的 RustSBI 功能较弱，它并没有能力完成加载的工作，内核镜像实际上是和 bootloader 一起在 Qemu 启动之前加载到物理内存中的。

* 第三阶段：控制权被转移给操作系统。由于篇幅所限后面我们就不再赘述了。

值得一提的是，为了让计算机的启动更加灵活，bootloader 目前可能非常复杂：它可能也分为多个阶段，并且能管理一些硬件资源，从复杂性上它已接近一个传统意义上的操作系统。

# qemu
```
qemu-system-riscv64 \
    -machine virt \
    -nographic \
    -bios ../bootloader/rustsbi-qemu.bin \
    -device loader,file=target/riscv64gc-unknown-none-elf/release/os.bin,addr=0x80200000
```

# bss
Block Started Symbol

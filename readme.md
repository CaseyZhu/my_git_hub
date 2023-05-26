https://speech.ee.ntu.edu.tw/~hylee/ml/2022-spring.php  

https://inst.eecs.berkeley.edu/~cs152/sp22/  

https://zhuanlan.zhihu.com/p/485992286  https://aijishu.com/a/1060000000311702  H100  

https://images.nvidia.com/aem-dam/en-zz/Solutions/data-center/nvidia-ampere-architecture-whitepaper.pdf  https://zhuanlan.zhihu.com/p/146042266 A100

https://silcnitc.github.io/roadmap.html  lex && yacc  

http://jonathan2251.github.io/lbd/llvmstructure.html  llvm back end  


https://en.wikipedia.org/wiki/Superscalar_processor  
https://en.wikipedia.org/wiki/Cyrix_6x86#cite_note-M1DataSheet-45  
https://zhuanlan.zhihu.com/p/64744154  https://zhuanlan.zhihu.com/p/299108528 量化  

https://en.wikipedia.org/wiki/Pseudo-LRU  

https://zhuanlan.zhihu.com/p/61762831 Turing T4  

https://blog.csdn.net/weixin_38669561/article/details/105219896  

http://rcore-os.cn/rCore-Tutorial-Book-v3/chapter2/3batch-system.html#id1  

https://www.jiqizhixin.com/articles/2021-02-24-7  


https://www.techpowerup.com/gpu-specs/  

https://paddlepedia.readthedocs.io/en/latest/tutorials/CNN/convolution_operator/3D_Convolution.html  Paddle-Paddle

https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html#instruction-set-ref GPU 指令集

https://carpentries-incubator.github.io/lesson-gpu-programming/ GPU training

https://zhuanlan.zhihu.com/p/84219777  混合精度训练fp32+fp16， fp32 转fp16 会乘一个系数防止fp16溢出（最大值溢出和小数位溢出），整个计算过程用fp16，但是最终的weight 和 loss 为了防止溢出都采用fp32

https://zhuanlan.zhihu.com/p/576002611 transformer engine 混合精度训练， TE 内部可以设置统计窗口的大小，硬件自动以某种方式统计窗口内值的范围（一般是absmax）,然后反馈给软件调整精度

https://blog.csdn.net/weixin_42730667/article/details/109838089 GPU simt 流水实现

https://blog.csdn.net/i_chip_backend/article/details/121130370 sram

https://zhuanlan.zhihu.com/p/372973726 卷积实现

https://zhuanlan.zhihu.com/p/372973726 GEMM

https://csstormq.github.io/blog/LLVM%20%E4%B9%8B%E5%90%8E%E7%AB%AF%E7%AF%87%EF%BC%882%EF%BC%89%EF%BC%9A%E5%A6%82%E4%BD%95%E6%89%A9%E5%B1%95%20llc%20%E7%9A%84%E7%9B%AE%E6%A0%87%E5%90%8E%E7%AB%AF  llvm 后端


https://zhuanlan.zhihu.com/p/61898234  反向传播，需要记录中间结果，max pooling 需要记录位置信息。向前传递的信息包括delta forward, 以及当前层的delta weight

https://skfwe.cn/p/iverilog--gtkwave-%E7%AE%80%E5%8D%95%E4%BD%BF%E7%94%A8/ gtk-wave 使用

https://docs.boom-core.org/en/latest/sections/rename-stage.html#id4  BOOM out of order

https://accel-sim.github.io/

https://zhuanlan.zhihu.com/p/472473665 CAche basic

4800TOPS*1bit（相当于INT8算力600TOPS），I/O双向带宽大于或等于600GB/s才会受到限制

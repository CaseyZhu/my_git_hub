## embedding
Embedding在数学上表示一个maping, f: X -> Y， 也就是一个function，其中该函数是injective（就是我们所说的单射函数，每个Y只有唯一的X对应，反之亦然）和structure-preserving (结构保存，比如在X所属的空间上X1 < X2,那么映射后在Y所属空间上同理 Y1 < Y2)。那么对于word embedding，就是将单词word映射到另外一个空间，其中这个映射具有injective和structure-preserving的特点。
通俗的翻译可以认为是单词嵌入，就是把X所属空间的单词映射为到Y空间的多维向量，那么该多维向量相当于嵌入到Y所属空间中，一个萝卜一个坑。
word embedding，就是找到一个映射或者函数，生成在一个新的空间上的表达，该表达就是word representation。
推广开来，还有image embedding, video embedding, 都是一种将源数据映射到另外一个空间。

create_clock -name CLK -period 1 [get_ports clk]


set ins [remove_from_collection [all_inputs] [get_attribute [all_clocks] sources]]
set outs [all_outputs]
set_input_delay 0.6 -clock CLK $ins
set_output_delay 0.6 -clock CLK $outs


You have to create a mode flag in the Specification/Mappings/Flags first, then you will find the mode flag in the memory field. After this, you would set the value accordingly.


verilog：
除以常数是可以综合的，包括 a/3, a % 3 ...对于常数综合工具可以进行优化。

# How a instruction being executed on a CPU ?

When it comes to a computer, CPU plays a important role in a whole system. Today, we will dive into the micro-CPU world and figure out how a command being fetched, executed, eventually complete it’s mission under five steps.

1. Fetch <br>
    First, the command is not alyways stored in the CPU, so the operation of moving command form RAM to CPU is required.

2. Decode <br>
    Second, after the data being setup in the CPU, we need to know the intention of it. So the full command would be splitted into multiple parts, including operation code, register id and binary data. The next step is highly affacted by those field, so we need to make sure we done this step right.

3. Execute <br>
    After that, we’ve already known what the command wants to do. So the appropriate hardware is selected by the multiplexer to done the job. 

4. Write Memory <br>
    Finally, the valuable output calculated by the hardware needs to be stored back in to memory, or the work we’ve done been in vain.

5. Write Register <br>
    Furthermore, the write back to register operation might be requested by the command. So this step would be execute under specifc circumstances, mostly like there are some output needs to be used in the next command.

After all of the sequence, an command just successfully executed on the CPU. Precise results and stable hardware is required for each steps, because if any of them goes wrong, it will affect the next instruction. So it is responsibility of manufacturers like Intel or AMD to ensure their chips are stable enough to complete these 5 step billions of times.
# "Generic Bubble Sort"
A single block generic parallel bubble sort implementation (CUDA)

## Compilation

    # run from repo dir
    nvcc -o out/generic-bubble-sort generic-bubble-sort.cu

## TODOs

-[x] push the integer version (done by [Nadhir](https://github.com/nzingo))
-[ ] write the generic version
-[ ] optimize memory access by using the shared memory

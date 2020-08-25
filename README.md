# "Generic Bubble Sort"
> A single block generic parallel bubble sort implementation (CUDA)

## Compile

    # run from repo dir
    nvcc -o out/generic-bubble-sort generic-bubble-sort.cu
    
## Approach

To know how this implementation works, check [this answer](https://stackoverflow.com/a/63567939/3503855) posted on stackoverflow.

## TODOs

- [x] push the integer version (done by [Nadhir](https://github.com/nzingo))
- [x] write the generic version
- [ ] optimize memory access by using the shared memory
- [ ] describe the parallel approach in the README.md

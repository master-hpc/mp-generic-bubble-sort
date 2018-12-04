
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>


__global__ void sortKernel(int *v, int n)
{
	for (int i = 0; i < n; i++) {

		int indice = 2 * threadIdx.x + (i % 2);

		if ((indice + 1 < n) && (v[indice] > v[indice + 1])) {
			int m = v[indice];
			v[indice] = v[indice + 1];
			v[indice + 1] = m;
		}

	}
}

int main()
{
	const int arraySize = 10;
	int v[arraySize] = { 3, 7, 1, 10, 6, 9, 5, 2, 8, 4 };


	int *dev_v = 0;

	cudaMalloc((void**)&dev_v, arraySize * sizeof(int));

	cudaMemcpy(dev_v, v, arraySize * sizeof(int), cudaMemcpyHostToDevice);

	sortKernel << <1, arraySize / 2 >> >(dev_v, arraySize);

	cudaMemcpy(v, dev_v, arraySize * sizeof(int), cudaMemcpyDeviceToHost);

	cudaFree(dev_v);

	for (int i = 0; i < arraySize; i++) {
		printf(" %d ", v[i]);
	}

	return 0;
}


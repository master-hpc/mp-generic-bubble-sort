#include <iostream>

__global__ void bubbleSort(int *v, const int n);

int main(int argc, char** argv)
{
	// vector size
	const int size = 10;

	// host vector
	int h_v[size] = { 3, 7, 1, 10, 6, 9, 5, 2, 8, 4 };

	// device vector
	int *d_v = 0;

	cudaMalloc((void**)&d_v, size * sizeof(int));

	cudaMemcpy(d_v, h_v, size * sizeof(int), cudaMemcpyHostToDevice);

	dim3 grdDim(1, 1, 1);
	dim3 blkDim(size / 2, 1, 1);

	bubbleSort <<<grdDim, blkDim>>>(d_v, size);

	cudaMemcpy(h_v, d_v, size * sizeof(int), cudaMemcpyDeviceToHost);

	cudaFree(d_v);

	for (int i = 0; i < size; i++) {
		std::cout << (i == 0 ? "{ " : "") <<  h_v[i] << (i < size -1 ? " ," : "}");
	}
	std::cout << std::endl;
	return 0;
}

__global__ void bubbleSort(int *v, const int n)
{
	int tIdx = threadIdx.x;

        for (int i = 0; i < n; i++) {

		int offset = i % 2;
                int indiceGauche = 2 * tIdx + offset;
		int indiceDroite = indiceGauche + 1;

                if (indiceDroite < n) {
			if (v[indiceGauche] > v[indiceDroite]) {
				int tmp = v[indiceGauche];
                        	v[indiceGauche] = v[indiceDroite];
                        	v[indiceDroite] = tmp;
			}
                }
		__syncthreads();

        }
}

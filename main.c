#include <iostream>
#include <stdlib.h>

using namespace std;

int rangeBitwiseAnd(int m, int n) {
    int shift = 0;

    while (m < n) {
      m >>= 1;
      n >>= 1;
      ++shift;
    }
    return m << shift;
}

int main(int argc, char* argv[]) {
    if(argc != 3) return -1;
    int start = atoi(argv[1]), end = atoi(argv[2]);
    int result = rangeBitwiseAnd(start, end);
    cout << "result: " << result << endl;
    return 0;
}


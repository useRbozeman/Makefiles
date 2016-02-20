#include <fstream>

int main(void)
{
    std::ifstream infile("num.txt");
    std::ofstream outfile("count.txt");


    int num;
    int sum = 0;

    while (infile >> num)
    {
        sum += num;
    }

    outfile << sum;

    return 0;
}


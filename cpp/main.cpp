

#include <fstream>
#include <iostream>


int main()
{
    std::ifstream file("/mnt/c/Users/kiril/Desktop/strace/README.md");
    if (!file)
    {
        std::cerr << "Could not open file" << std::endl;
        return 1;
    }

    std::cout << file.rdbuf();
    file.close();
    return 0;
}
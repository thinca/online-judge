#include <iostream>

const int SIZE_MAX = 101;

int main(int argc, const char *argv[]) {
    char room[SIZE_MAX][SIZE_MAX];

    while (true) {
        int w, h;
        std::cin >> h >> w;
        if (w == 0) {
            break;
        }
        std::cin.getline(room[0], SIZE_MAX);

        for (int i = 0; i < h; i++) {
            std::cin.getline(room[i], SIZE_MAX);
        }

        int px = 0, py = 0;
        bool cont = true;
        while (cont) {
            switch (room[py][px]) {
                case '.':
                    std::cout << px << ' ' << py << std::endl;
                    cont = false;
                    break;
                case '_':
                    std::cout << "LOOP" << std::endl;
                    cont = false;
                    break;
                case '>':
                    room[py][px] = '_';
                    px++;
                    break;
                case '<':
                    room[py][px] = '_';
                    px--;
                    break;
                case 'v':
                    room[py][px] = '_';
                    py++;
                    break;
                case '^':
                    room[py][px] = '_';
                    py--;
                    break;
            }
        }
    }

    return 0;
}

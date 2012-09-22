#include <iostream>
#include <vector>
#include <map>

static const int MAX = 1000000;

int main(int argc, char const* argv[]) {
    std::vector<int> ids;  // for order
    std::map<int, long long int> totals;
    int recordNum;
    std::cin >> recordNum;
    int id;
    while (recordNum != 0) {
        for (int i = 0; i < recordNum; i++) {
            int id;
            long long int unit, count;
            std::cin >> id >> unit >> count;
            if (!totals.count(id)) {
                ids.push_back(id);
                totals[id] = 0;
            }
            if (totals[id] < MAX) {
                totals[id] += unit * count;
            }
        }
        bool exists = false;
        for (int i = 0, n = ids.size(); i < n; i++) {
            if (MAX <= totals[ids[i]]) {
                std::cout << ids[i] << std::endl;
                exists = true;
            }
        }
        if (!exists) {
            std::cout << "NA" << std::endl;
        }

        ids.clear();
        totals.clear();
        std::cin >> recordNum;
    }
    return 0;
}

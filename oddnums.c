#include <unistd.h>

int main() {
	char i = 0x31;
	do {
		write(1, &i, 1);
		i += 2;
	} while(i <= 0x39);
	i = 0xA;
	write(1, &i, 1);
	_exit(0);
}

int main()
{
	char *p = 0x20000000;
	for(int i = 0; i < 4096; i++) {
		p[i] = 0xff;
	}
	while(1) {}

	return 0;
}

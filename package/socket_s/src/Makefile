all:socket_s

%o:%c
	%(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c -I. -Iinclude -o $@ $^

socket_s:socket_s.o
	$(CC) -o $@ $^ -L.

clean:
	rm -f *.o socket_s

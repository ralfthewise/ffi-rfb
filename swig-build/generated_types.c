#include <stdio.h>
#include <sys/select.h> /*fd_set*/
#include <netinet/in.h> /*in_addr_t*/
#include <arpa/inet.h> /*sockaddr_in*/
#include <pthread.h> /*pthread_t*/
#include <zlib.h> /*z_stream_s*/

int main(int argc, char **argv) {
  FILE *out = fopen("generated_types.i", "w");

  fprintf(out, "%%module rfb\n\n");

  /*fprintf(out, "typedef char in_addr_t[%d];\n\n", (int) sizeof(in_addr_t));*/

  fprintf(out, "typedef char fd_set[%d];\n\n", (int) sizeof(fd_set));
  fprintf(out, "typedef char pthread_t[%d];\n\n", (int) sizeof(pthread_t));

  fprintf(out, "struct sockaddr_in\n");
  fprintf(out, "{\n");
  fprintf(out, "  char inner_sockaddr_in[%d];\n", (int) sizeof(struct sockaddr_in));
  fprintf(out, "};\n\n");

  fprintf(out, "struct timeval\n");
  fprintf(out, "{\n");
  fprintf(out, "  char inner_timeval[%d];\n", (int) sizeof(struct timeval));
  fprintf(out, "};\n\n");

  fprintf(out, "typedef struct z_stream_s\n");
  fprintf(out, "{\n");
  fprintf(out, "  char inner_z_stream_s[%d];\n", (int) sizeof(struct z_stream_s));
  fprintf(out, "} z_stream;\n\n");

  fclose(out);

  return(0);
}

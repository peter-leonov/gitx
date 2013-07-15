#include "common.h"
#include "thread-utils.h" /* for GIT_TLS */

/* compile-time constant initialization required */
#ifdef GIT_PTHREAD_TLS
pthread_key_t git_errno_key = 0;
#else
GIT_TLS int git_errno = 0;
#endif

static struct {
	int num;
	const char *str;
} error_codes[] = {
	{ GIT_ENOTOID, "Not a git oid" },
	{ GIT_ENOTFOUND, "Object does not exist in the scope searched" },
};

const char *git_strerror(int num)
{
	int i;
	for (i = 0; i < ARRAY_SIZE(error_codes); i++)
		if (num == error_codes[i].num)
			return error_codes[i].str;

	return "Unknown error";
}
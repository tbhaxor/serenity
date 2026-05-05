/*
 * Copyright (c) 2022, Peter Elliott <pelliott@serenityos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

/* complex arithmetic
 *
 * https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/complex.h.html
 */

#pragma once

#ifdef __cplusplus
#    error "C++ code must not include complex.h. Use AK/Complex.h instead."
#endif

#include <stddef.h>
#include <sys/cdefs.h>

__BEGIN_DECLS

#define complex _Complex

#define _Complex_I (0.0f + 1.0fi)
#define I _Complex_I

#define CMPLX(x, y) ((double _Complex)__builtin_complex((double)x, (double)y))
#define CMPLXF(x, y) ((float _Complex)__builtin_complex((float)x, (float)y))
#define CMPLXL(x, y) ((long double _Complex)__builtin_complex((long double)x, (long double)y))

// These are macro implementations of the above functions, so that they will always be inlined.
#define creal(z) ((double)__real__((double _Complex)(z)))
#define crealf(z) ((float)__real__((float _Complex)(z)))
#define creall(z) ((long double)__real__((long double _Complex)(z)))

#define cimag(z) ((double)__imag__((double _Complex)(z)))
#define cimagf(z) ((float)__imag__((float _Complex)(z)))
#define cimagl(z) ((long double)__imag__((long double _Complex)(z)))

#define conj(z) (__builtin_conj(z))
#define conjf(z) (__builtin_conjf(z))
#define conjl(z) (__builtin_conjl(z))

#define cabs(z) (__builtin_cabs(z))
#define cabsf(z) (__builtin_cabsf(z))
#define cabsl(z) (__builtin_cabsl(z))

#define csqrt(z) (__builtin_csqrt(z))
#define csqrtf(z) (__builtin_csqrtf(z))
#define csqrtl(z) (__builtin_csqrtl(z))

#define cexp(z) (__builtin_cexp(z))
#define cexpf(z) (__builtin_cexpf(z))
#define cexpl(z) (__builtin_cexpl(z))

#define csin(z) (__builtin_csin(z))
#define csinf(z) (__builtin_csinf(z))
#define csinl(z) (__builtin_csinl(z))

// Function definitions of this form "type (name)(args)" are intentional, to
// prevent macro versions of "name" from being incorrectly expanded. These
// functions are here to provide external linkage to their macro implementations.

// https://pubs.opengroup.org/onlinepubs/9699919799/functions/creal.html
static inline float(crealf)(float complex z)
{
    return crealf(z);
}

static inline double(creal)(double complex z)
{
    return creal(z);
}

static inline long double(creall)(long double complex z)
{
    return creall(z);
}

// https://pubs.opengroup.org/onlinepubs/9699919799/functions/cimag.html
static inline double(cimag)(double complex z)
{
    return cimag(z);
}

static inline float(cimagf)(float complex z)
{
    return cimagf(z);
}

static inline long double(cimagl)(long double complex z)
{
    return cimagl(z);
}

// https://pubs.opengroup.org/onlinepubs/9699919799/functions/conj.html
static inline double complex(conj)(double complex z)
{
    return conj(z);
}

static inline float complex(conjf)(float complex z)
{
    return conjf(z);
}

static inline long double complex(conjl)(long double complex z)
{
    return conjl(z);
}

// https://pubs.opengroup.org/onlinepubs/9699919799/functions/cabs.html
static inline double(cabs)(double complex z)
{
    return cabs(z);
}

static inline float(cabsf)(float complex z)
{
    return cabsf(z);
}

static inline long double(cabsl)(long double complex z)
{
    return cabsl(z);
}

// https://pubs.opengroup.org/onlinepubs/9699919799/functions/csqrt.html
static inline float complex(csqrtf)(float complex z)
{
    return csqrtf(z);
}

static inline double complex(csqrt)(double complex z)
{
    return csqrt(z);
}

static inline long double complex(csqrtl)(long double complex z)
{
    return csqrtl(z);
}

// https://pubs.opengroup.org/onlinepubs/9699919799/functions/cexp.html
static inline float complex(cexpf)(float complex z)
{
    return cexpf(z);
}

static inline double complex(cexp)(double complex z)
{
    return cexp(z);
}

static inline long double complex(cexpl)(long double complex z)
{
    return cexpl(z);
}

// https://pubs.opengroup.org/onlinepubs/9699919799/functions/csin.html
static inline float complex(csinf)(float complex z)
{
    return csinf(z);
}

static inline double complex(csin)(double complex z)
{
    return csin(z);
}

static inline long double complex(csinl)(long double complex z)
{
    return csinl(z);
}
__END_DECLS

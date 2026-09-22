/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Shim for missing cutils atomic symbols referenced by Marshmallow libsec-ril.so.
 * On Android 8.1 (Oreo), some inline atomic functions from cutils/atomic.h were
 * removed from the shared library ABI. This shim provides the missing symbols.
 */

#include <stdint.h>
#include <stdatomic.h>

int32_t android_atomic_acquire_load(volatile const int32_t *ptr) {
    return atomic_load_explicit((_Atomic int32_t *)ptr, memory_order_acquire);
}

void android_atomic_release_store(int32_t value, volatile int32_t *ptr) {
    atomic_store_explicit((_Atomic int32_t *)ptr, value, memory_order_release);
}

int32_t android_atomic_inc(volatile int32_t *ptr) {
    return atomic_fetch_add_explicit((_Atomic int32_t *)ptr, 1, memory_order_seq_cst);
}

int32_t android_atomic_dec(volatile int32_t *ptr) {
    return atomic_fetch_sub_explicit((_Atomic int32_t *)ptr, 1, memory_order_seq_cst);
}

int32_t android_atomic_add(int32_t increment, volatile int32_t *ptr) {
    return atomic_fetch_add_explicit((_Atomic int32_t *)ptr, increment, memory_order_seq_cst);
}

int32_t android_atomic_and(int32_t value, volatile int32_t *ptr) {
    return atomic_fetch_and_explicit((_Atomic int32_t *)ptr, value, memory_order_seq_cst);
}

int32_t android_atomic_or(int32_t value, volatile int32_t *ptr) {
    return atomic_fetch_or_explicit((_Atomic int32_t *)ptr, value, memory_order_seq_cst);
}

int android_atomic_cmpxchg(int32_t old_value, int32_t new_value, volatile int32_t *ptr) {
    return !atomic_compare_exchange_strong_explicit(
        (_Atomic int32_t *)ptr, &old_value, new_value,
        memory_order_seq_cst, memory_order_seq_cst);
}

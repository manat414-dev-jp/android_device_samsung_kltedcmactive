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
 * Shim for missing binder/RIL symbols referenced by Marshmallow libsec-ril.so
 * on Android 8.1 (Oreo).
 *
 * IPCThreadState::joinThreadPool() — The Marshmallow RIL daemon expects to call
 * joinThreadPool() to keep the Binder thread alive. On Oreo, the symbol may
 * not be directly exported via the exact mangled name used in the old binary.
 * This stub keeps the linker happy; the actual Binder thread management is
 * handled by the framework's libbinder.so at runtime.
 */

#include <stdint.h>
#include <stdlib.h>

/*
 * _ZN7android14IPCThreadState14joinThreadPoolEb
 * = android::IPCThreadState::joinThreadPool(bool)
 */
void _ZN7android14IPCThreadState14joinThreadPoolEb(int dummy) {
    (void)dummy;
}


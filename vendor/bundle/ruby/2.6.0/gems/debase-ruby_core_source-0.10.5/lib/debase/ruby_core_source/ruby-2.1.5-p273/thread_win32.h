/**********************************************************************

  thread_win32.h -

  $Author: ko1 $

  Copyright (C) 2004-2007 Koichi Sasada

**********************************************************************/

/* interface */
#ifndef RUBY_THREAD_WIN32_H
#define RUBY_THREAD_WIN32_H

#include <windows.h>

# ifdef __CYGWIN__
# undef _WIN32
# endif

WINBASEAPI BOOL WINAPI
TryEnterCriticalSection(IN OUT LPCRITICAL_SECTION lpCriticalSection);

typedef HANDLE rb_nativethread_id_t;

typedef union rb_thread_lock_union {
    HANDLE mutex;
    CRITICAL_SECTION crit;
} rb_nativethread_lock_t;

typedef struct rb_thread_cond_struct {
    struct cond_event_entry *next;
    struct cond_event_entry *prev;
} rb_nativethread_cond_t;

typedef struct native_thread_data_struct {
    HANDLE interrupt_event;
} native_thread_data_t;

typedef struct rb_global_vm_lock_struct {
    HANDLE lock;
} rb_global_vm_lock_t;

#endif /* RUBY_THREAD_WIN32_H */


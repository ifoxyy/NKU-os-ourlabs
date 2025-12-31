#ifndef __KERN_SCHEDULE_SCHED_RR_H__
#define __KERN_SCHEDULE_SCHED_RR_H__

#include <sched.h>

extern struct sched_class default_sched_class;

/* stride scheduler migration helper (implemented in default_sched_stride.c) */
void stride_switch_in(struct run_queue *rq);

#endif /* !__KERN_SCHEDULE_SCHED_RR_H__ */



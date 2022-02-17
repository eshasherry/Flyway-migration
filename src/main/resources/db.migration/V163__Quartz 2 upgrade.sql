-- from http://www.quartz-scheduler.org/documentation/quartz-2.2.x/new-in-quartz-2_2.html
--
ALTER TABLE QRTZ_FIRED_TRIGGERS ADD COLUMN SCHED_TIME BIGINT(13) NOT NULL;

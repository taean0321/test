package ajax;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
public class QuartzTest {

	public static void main(String[] args) throws SchedulerException, InterruptedException {
		SchedulerFactory sf = new org.quartz.impl.StdSchedulerFactory();
		Scheduler sched = sf.getScheduler();
		
		JobDetail job = JobBuilder.newJob(MyJob.class)
					.withIdentity("myjob", "group1")
					.build();
		
		Trigger trigger = TriggerBuilder.newTrigger()
					.withIdentity("myTrigger", "group1")
					.startNow()
					.withSchedule(SimpleScheduleBuilder.simpleSchedule()
							.withIntervalInSeconds(20)	// 3초 마다
							.repeatForever())
					.build();
		
		sched.scheduleJob(job, trigger);
		sched.start();
		
		Thread.sleep(10000);	// main-thread가 10초 기다림.
		sched.shutdown();
	}
}

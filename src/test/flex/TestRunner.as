/**
 * User: Ken
 * Date: 05/11/2012
 */
package
{
	import com.AsteroidsTestSuite;
	import com.fiber.FiberTestSuite;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.listeners.CIListener;
	import org.flexunit.runner.FlexUnitCore;

	public class TestRunner
	{
		private var core:FlexUnitCore;


		public function TestRunner()
		{
			super();

			core = new FlexUnitCore();
			core.addListener(new TraceListener());
			core.addListener(new CIListener())
			core.run(AsteroidsTestSuite);
		}
	}
}

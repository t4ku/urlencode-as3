package urlencode  {
    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import flash.display.Sprite;

    public class AbstractHandlerTest {

        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var instance:AbstractHandler;

        [Before]
        public function setUp():void {
            instance = new AbstractHandler();
        }

        [After]
        public function tearDown():void {
            instance = null;
        }

        [Test]
        public function shouldBeInstantiated():void {
            assertTrue("instance is AbstractHandler", instance is AbstractHandler);
        }
    }
}


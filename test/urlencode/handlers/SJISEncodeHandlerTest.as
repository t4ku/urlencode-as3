package urlencode.handlers  {
    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import flash.display.Sprite;

    public class SJISEncodeHandlerTest {

        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var instance:SJISEncodeHandler;

        [Before]
        public function setUp():void {
            instance = new SJISEncodeHandler();
        }

        [After]
        public function tearDown():void {
            instance = null;
        }

        [Test]
        public function shouldBeInstantiated():void {
            assertTrue("instance is SJISEncodeHandler", instance is SJISEncodeHandler);
        }
    }
}


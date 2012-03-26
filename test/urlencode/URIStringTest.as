package urlencode  {
    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import asmock.framework.*;
    import flash.display.Sprite;

    [RunWith("asmock.integration.asunit.ASMockRunner")]
    public class URIStringTest {

        [Mock]
        public static var withMocks:Array = [];

        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var instance:URIString;
        private var mockRepos:MockRepository;

        [Before]
        public function setUp():void {
            mockRepos = new MockRepository();
            //instance = new URIString();
        }

        [After]
        public function tearDown():void {
            //instance = null;
        }

        [Test]
        public function shouldBeInstantiated():void {
            var instance:URIString = new URIString("test");
            assertTrue("instance is URIString", instance is URIString);
        }

        [Test]
        public function shouldDoNothingToReservedChars():void{
            var instance:URIString = new URIString("test");
            assertSame("test",instance.decode(URIString.SHIFT_JIS));
        }

    }
}


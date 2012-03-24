package {
    import asunit.core.TextCore;
    import flash.display.MovieClip;

    public class URLEncodeRunner extends MovieClip {
        private var core:TextCore;

        public function URLEncodeRunner(){
            core = new TextCore();
            core.start(AllTests, null, this);
        }

    }
}


require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Apod" do
    before do
        @apod = Apod.new
    end

    it "starts things off" do
        @apod.pictures[0].website.should match(/html/)
    end

    it "should return an array of titles" do
        @apod.titles.class.to_s.should == "Array"
    end

    it "searches for a picture" do
        results = @apod.search("earth")
        results.class.to_s.should match(/Pic/)
    end

    it "download the first picture" do
        @apod.pictures.first.download("/tmp/apod.jpg")
        `file /tmp/apod.jpg`.should match(/image data/)
        `rm /tmp/apod.jpg`
    end

    it "tries to search with a query that is too big" do
        @apod.search("A"*61).should match(/ERROR/)
    end


end

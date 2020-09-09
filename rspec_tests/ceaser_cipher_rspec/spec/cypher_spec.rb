require './lib/ceaser.rb'

describe "#ceaser" do
    it "takes in a string and encodes it by the key" do
        
        key = 10
        expect(ceaser_cypher("Ceaser", key)).to eql('Mokcob')
        expect(ceaser_cypher("23231Ceaser", key)).to eql('23231Mokcob')
        expect(ceaser_cypher("23231#!$41421414215sdadasdq23123", key)).to eql('23231#!$41421414215cnknkcna23123')
    end
    it "takes in a string with numbers and encodes it by the key" do
        
        key = 10
        expect(ceaser_cypher("Ceaser", key)).to eql('Mokcob')
        expect(ceaser_cypher("23231Ceaser", key)).to eql('23231Mokcob')
        expect(ceaser_cypher("2323141421414215sdadasdq23123", key)).to eql('2323141421414215cnknkcna23123')
    end
    
    it "takes in a string with numbs/chars and encodes it by the key" do
        
        key = 10
        expect(ceaser_cypher("Ceaser", key)).to eql('Mokcob')
        expect(ceaser_cypher("23231Ceaser", key)).to eql('23231Mokcob')
        expect(ceaser_cypher("23231#!$41421414215sdadasdq23123", key)).to eql('23231#!$41421414215cnknkcna23123')
    end
end

        
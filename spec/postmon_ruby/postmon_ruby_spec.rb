require "spec_helper"

module PostmonRuby
  describe Client do
    describe "#find" do
      context "with valid cep" do
        context "address with street" do
          let(:address) { PostmonRuby::Client.search("01330000") }
          it "returns a PostmonRuby::Address object" do
            expect(address).to be_a(PostmonRuby::Address)
          end
          it "returns a complete address" do
            expect(address.bairro).to eq "Bela Vista"
            expect(address.cidade).to eq "São Paulo"
            expect(address.logradouro).to eq "Rua Rocha"
            expect(address.estado).to eq "SP"
          end
        end

        context "address without street" do
          let(:address) { PostmonRuby::Client.search("85100000") }
          it "returns a PostmonRuby::Address object" do
            # binding.pry
            expect(address).to be_a(PostmonRuby::Address)
          end
          it "returns a empty 'logradouro' " do
            expect(address.logradouro).to be_empty
          end
        end
      end

      context "with invalid cep" do
        let(:address) { PostmonRuby::Client.search("99999999") }
        it "returns a PostmonRuby::Address object" do
          expect(address).to be_a(PostmonRuby::Address)
        end

        it "returns true in 'not_found'" do
          expect(address.not_found).to be_true
        end
      end

    end
  end  
end
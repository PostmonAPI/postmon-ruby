require "spec_helper"

module PostmonRuby
  module Finders
    describe CepFinder do
      describe "#search" do
        context "with too many arguments" do
          it "raise an ArgumentError" do
            expect{ PostmonRuby::Client.search(:cep, "01330000", "xxxx") }.to raise_error(ArgumentError)
          end
        end

        context "with valid cep" do
          context "address with street" do
            let(:address) { PostmonRuby::Client.search(:cep, "01330000") }
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
            let(:address) { PostmonRuby::Client.search(:cep, "85100000") }
            it "returns a PostmonRuby::Address object" do
              expect(address).to be_a(PostmonRuby::Address)
            end
            it "returns a empty 'logradouro' " do
              expect(address.logradouro).to be_empty
            end
          end
        end

        context "with invalid cep" do
          let(:address) { PostmonRuby::Client.search(:cep, "99999999") }
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
end

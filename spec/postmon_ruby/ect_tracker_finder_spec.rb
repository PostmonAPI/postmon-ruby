require "spec_helper"

module PostmonRuby
  module Finders
    module Tracker

      describe ECTTrackerFinder do
        describe "#search" do
          context "with too many arguments" do
            it "raise an ArgumentError" do
              expect{ PostmonRuby::Client.search(:rastreio, :ect, "TESTE", "1234123") }.to raise_error(ArgumentError)
            end
          end

          context "with less arguments" do
            it "raise an ArgumentError" do
              expect{ PostmonRuby::Client.search(:rastreio, :ect) }.to raise_error(ArgumentError)
            end
          end        

          context "with valid tracking code" do
            # WebMock.disable_net_connect!
            let(:track) { 
              #TODO - stubar a request para retornar um json
              # stub_request(:any, "api.postmon.com.br/v1/rastreio/ect/TESTE").
              #   to_return(body: File.new('spec/support/track.json').read.to_json, status: 200, content_type: 'application/json') 
              # PostmonRuby::Client.search(:rastreio, :ect, "TESTE" ) 
              PostmonRuby::Client.search(:rastreio, :ect, "PG864394568BR")
            }
            it "returns a PostmonRuby::Track object" do
              expect(track).to be_a(PostmonRuby::Track)
            end
            it "returns array in history attribute" do
              expect(track.historico).to be_a(Array)
            end
            it "returns 6 itens in history" do
              track.historico.should have(6).items
            end
            it "returns a complete track info" do
              expect(track.servico).to eq "ect"
              expect(track.codigo).to eq "PG864394568BR"
              expect(track.historico.first["local"]).to eq "CEE VILA NOVA CACHOEIRINHA - SAO PAULO/SP"
              expect(track.historico.first["situacao"]).to eq "Postado"
            end
            # WebMock.allow_net_connect!          
          end
   
          context "with invalid tracking code" do
            let(:track) { PostmonRuby::Client.search(:rastreio, :ect, "00000000") }
            it "returns a PostmonRuby::Track object" do
              expect(track).to be_a(PostmonRuby::Track)
            end
            it "returns true in 'not_found'" do
              expect(track.not_found).to be_true
            end          
          end

        end
      end
    end  
  end
end
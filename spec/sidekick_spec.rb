require_relative "../sidekick"

describe Sidekick do
  let(:sidekick) { Sidekick.new(sidekick_data) }
  let(:sidekick_data) do
    { :name            => "Bat-Girl",
      :alter_ego       => "Bette Kane",
      :intelligence    => 58,
      :loyalty         => 78,
      :resourcefulness => 65,
      :humor           => 75 }
  end

  it "has a name" do
    expect(sidekick.name).to eq "Bat-Girl"
  end

  it "has an alter ego" do
    expect(sidekick.alter_ego).to eq "Bette Kane"
  end

  it "has a loyalty rating" do
    expect(sidekick.loyalty).to eq 78
  end

  it "has a resourcefulness rating" do
    expect(sidekick.resourcefulness).to eq 65
  end

  it "has a humor rating" do
    expect(sidekick.humor).to eq 75
  end

  describe "belonging to a superhero" do
    let(:batwoman) { double("superhero", :sidekick= => nil) }

    context "when the sidekick does not already work with a superhero" do
      it "can be given a superhero" do
        expect { sidekick.superhero = batwoman }.to change { sidekick.superhero }.to(batwoman)
      end

      it "tells the superhero that it is now the superhero's sidekick" do
        expect(batwoman).to receive(:sidekick=).with(sidekick)
        sidekick.superhero = batwoman
      end
    end

    context "when the sidekick already has a superhero" do
      let(:old_superhero) { double("superhero", :sidekick= => nil) }

      before(:each) do
        sidekick.superhero = old_superhero
      end

      it "can be given a new superhero" do
        expect { sidekick.superhero = batwoman }.to change { sidekick.superhero }.to(batwoman)
      end

      it "tells the old superhero that is is no longer its sidekick" do
        expect(old_superhero).to receive(:sidekick=).with(nil)
        sidekick.superhero = batwoman
      end

      it "tells the new superhero that it is now the superhero's sidekick" do
        expect(batwoman).to receive(:sidekick=).with(sidekick)
        sidekick.superhero = batwoman
      end

      context "when the new superhero is the old superhero" do
        it "does not change the superhero" do
          expect { sidekick.superhero = old_superhero }.to_not change { sidekick.superhero }
        end

        it "does not tell the old superhero that it is its sidekick" do
          expect(old_superhero).to_not receive(:sidekick=)
          sidekick.superhero = old_superhero
        end
      end

      describe "removing a superhero" do
        it "sets the superhero to nil" do
          expect { sidekick.superhero = nil }.to change { sidekick.superhero }.to(nil)
        end

        it "tells the old super hero that it is no longer its sidekick" do
          expect(old_superhero).to receive(:sidekick=).with(nil)
          sidekick.superhero = nil
        end
      end
    end
  end
end

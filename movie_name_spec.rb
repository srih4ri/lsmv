require './movie_name'
describe MovieName do
  describe '#cleanup' do
    it 'cleans up the name ' do
      MovieName.new('Bling.axxo.avi').cleanup.should == 'Bling'
    end
  end
end

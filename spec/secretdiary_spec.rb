require 'secretdiary.rb'

describe SecretDiary do
  let(:journal) {SecretDiary.new}

  it { is_expected.to respond_to(:lock, :unlock, :get_entries, :add_entry)}

  describe 'add_entry' do
    it 'will not allow user to create a new entry if diary is locked' do
      input = "First journal entry"
      expect { journal.add_entry(input) }.to raise_error("diary locked!")
    end
  end

  describe 'unlock' do
    it 'will unlock the diary by setting status instance variable to true' do
      journal.unlock
      expect(journal.status).to eq(true)
    end
  end

  context "Testing adding an entry and returning it using get entry" do
    before do
      journal.unlock
      input = 'First journal entry'
      journal.add_entry(input)
    end

    describe 'add_entry' do
      it 'will add an entry to journal, if unlocked,' do
        expect(journal.entry[0]).to eq("First journal entry")
      end
    end

    describe 'get_entries' do
      it 'displays entries, if unlocked' do
        expect do
          journal.get_entries
        end.to output("First journal entry").to_stdout
      end
    end
  end
end

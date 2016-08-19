# Create a thesaurus application. To create it, you will create two classes, Thesaurus and Entry.
# A Thesaurus will contain many Entries. An Entry contains three primary attributes:
# word, synonymns, and antonyms. Your application should contain the following features:
# 1. The ability to add new words to a Thesaurus.
# 2. The ability to delete a word from a Thesaurus.
# 3. The ability to look up a word's synonyms.
# 4. The ability to look up a word's antonyms.
# 5. The ability to add a synonym to a word.
# 6. The ability to add an antonym to a word.
#
# Part of the challenge is to determine which functionality belongs in the Thesaurus class,
# and which belongs in the Entry class.
#
# And... test your functionality using RSpec!

require 'rspec'

class Thesaurus
  attr_reader :words
  def initialize
    @words = []
  end

  def add_new(word)
    @words << word
  end

  def delete(word)
    @words.delete_if { |entry| entry == word }
  end

  def find_synonym(entry)
    entry.synonyms
  end

  def find_antonyms(entry)
    entry.antonyms
  end
end

class Entry
  attr_reader :belonging, :synonyms, :antonyms
  def initialize(word)
    @belonging = word
    @synonyms = []
    @antonyms = []
  end

  def add_synonyms(word)
    @synonyms << word
  end

  def add_antonyms(word)
    @antonyms << word
  end
end

RSpec.describe Thesaurus do
  describe '#add_new' do
    it "add a new word to the thesaurus" do
      thesaurus = Thesaurus.new
      thesaurus.add_new("big")
      thesaurus.add_new("small")
      thesaurus.add_new("soft")
      expect(thesaurus.words).to eq(["big", "small", "soft"])
    end
  end

  describe '#delete' do
    it "delete a word in the thesaurus" do
      thesaurus = Thesaurus.new
      thesaurus.add_new("big")
      thesaurus.add_new("small")
      thesaurus.add_new("soft")
      thesaurus.delete("small")
      expect(thesaurus.words).to eq(["big", "soft"])
    end
  end

  describe '#find_synonym' do
    it "delete a word in the thesaurus" do
      thesaurus = Thesaurus.new
      thesaurus.add_new("big")
      entry_1 = Entry.new("big")
      entry_1.add_synonyms("large")
      entry_1.add_synonyms("huge")
      expect(thesaurus.find_synonym(entry_1)).to eq(["large", "huge"])
    end
  end

  describe '#find_antonyms' do
    it "delete a word in the thesaurus" do
      thesaurus = Thesaurus.new
      thesaurus.add_new("big")
      entry_1 = Entry.new("big")
      entry_1.add_antonyms("tiny")
      expect(thesaurus.find_antonyms(entry_1)).to eq(["tiny"])
    end
  end
end

RSpec.describe Entry do
  describe '#add_synonyms' do
    it "adds a synonym to the word" do
      entry_1 = Entry.new("big")
      entry_1.add_synonyms("large")
      entry_1.add_synonyms("huge")
      expect(entry_1.synonyms).to eq(["large", "huge"])
    end
  end

  describe '#add_antonyms' do
    it "adds a antonym to the word" do
      entry_2 = Entry.new("small")
      entry_2.add_antonyms("large")
      entry_2.add_antonyms("tremendous")
      expect(entry_2.antonyms).to eq(["large", "tremendous"])
    end
  end
end

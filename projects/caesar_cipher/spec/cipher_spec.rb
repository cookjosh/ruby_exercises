require './lib/cipher'

describe Cipher do
  describe "#caeser_cipher" do
    it "returns string `khoor` for `hello` rotated 3" do
      cipher = Cipher.new
      expect(cipher.caesar_cipher('hello', 3)).to eql('khoor')
    end

    it "returns ciphered string with correct punctuation from original" do
      cipher = Cipher.new
      expect(cipher.caesar_cipher('hello, world!', 3)).to eql('khoor, zruog!')
    end

    it "returns correct case of the original string" do
      cipher = Cipher.new
      expect(cipher.caesar_cipher('Hello, World!', 3)).to eql('Khoor, Zruog!')
    end

    it "returns correct case of the original string with mixed case" do
      cipher = Cipher.new
      expect(cipher.caesar_cipher('HeLlO, WoRlD!', 3)).to eql('KhOoR, ZrUoG!')
    end
  end
end
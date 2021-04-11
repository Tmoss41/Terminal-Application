class EmptyField < StandardError
    def initialize
        super("Invalid Age Please Enter a proper number")
    end
end

class InsufficientFunds < StandardError
    def initialize
        super('Invalid amount of Money in Account')
    end
end


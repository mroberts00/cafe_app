module Payment
    module_function
    def separate_payments_receipt(receipt)
        rows = []
        receipt.each do |item, price|
            rows << [item.capitalize, ("$"'%.2f' % price).rjust(8)]
        end
        return rows
    end
end
module SCSSLint
    class Linter::ModifierRelatedToParent < Linter
        include LinterRegistry
        @primary

        def visit_sequence(sequence)
            seq = sequence.to_s
            if seq.include? "--"
                if !seq.start_with?('&')
                    add_lint(sequence, "Modifier #{seq} should start with '&' and be force chained to its wrapper class.")
                end

                if !seq.include?@primary
                    add_lint(sequence, "Modifier #{seq} is chained to the class #{@primary} but does not share the name.")
                end
            else
                @primary = seq
            end
        end

    end
end
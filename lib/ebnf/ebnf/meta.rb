# This file is automatically generated by ebnf version 2.0.0
# Derived from ../etc/ebnf.ebnf
module EBNFMeta
  RULES = [
    EBNF::Rule.new(:ebnf, "1", [:star, :_ebnf_1]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_ebnf_1, "1.1", [:alt, :declaration, :rule]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:declaration, "2", [:alt, "@terminals", :pass]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:rule, "3", [:seq, :LHS, :expression]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:expression, "4", [:seq, :alt]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:alt, "5", [:seq, :seq, :_alt_1]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_alt_1, "5.1", [:star, :_alt_2]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_alt_2, "5.2", [:seq, "|", :seq]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:seq, "6", [:plus, :diff]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:diff, "7", [:seq, :postfix, :_diff_1]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_diff_1, "7.1", [:opt, :_diff_2]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_diff_2, "7.2", [:seq, "-", :postfix]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:postfix, "8", [:seq, :primary, :_postfix_1]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_postfix_1, "8.1", [:opt, :POSTFIX]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:primary, "9", [:alt, :HEX, :SYMBOL, :ENUM, :O_ENUM, :RANGE, :O_RANGE, :STRING1, :STRING2, :_primary_1]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_primary_1, "9.1", [:seq, "(", :expression, ")"]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:pass, "10", [:seq, "@pass", :expression]).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:LHS, "11", [:seq, :_LHS_1, :SYMBOL, :_LHS_2, "::="], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_LHS_1, "11.1", [:opt, :_LHS_3], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_LHS_3, "11.3", [:seq, "[", :SYMBOL, "]", :_LHS_4], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_LHS_4, "11.4", [:plus, " "], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_LHS_2, "11.2", [:star, " "], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:SYMBOL, "12", [:plus, :_SYMBOL_1], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_SYMBOL_1, "12.1", [:alt, :_SYMBOL_2, :_SYMBOL_3, :_SYMBOL_4, "_", "."], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_SYMBOL_2, "12.2", [:range, "a-z"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_SYMBOL_3, "12.3", [:range, "A-Z"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_SYMBOL_4, "12.4", [:range, "0-9"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:HEX, "13", [:seq, "#x", :_HEX_1], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_HEX_1, "13.1", [:plus, :_HEX_2], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_HEX_2, "13.2", [:alt, :_HEX_3, :_HEX_4, :_HEX_5], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_HEX_3, "13.3", [:range, "a-f"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_HEX_4, "13.4", [:range, "A-F"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_HEX_5, "13.5", [:range, "0-9"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:ENUM, "14", [:diff, :_ENUM_1, :LHS], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_ENUM_1, "14.1", [:alt, :_ENUM_2, :_ENUM_3], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_ENUM_2, "14.2", [:seq, "[", :_ENUM_4], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_ENUM_4, "14.4", [:plus, :R_CHAR], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_ENUM_3, "14.3", [:seq, :_ENUM_5, "]"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_ENUM_5, "14.5", [:plus, :HEX], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:O_ENUM, "15", [:alt, :_O_ENUM_1, :_O_ENUM_2], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_O_ENUM_1, "15.1", [:seq, "[^", :_O_ENUM_3], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_O_ENUM_3, "15.3", [:plus, :R_CHAR], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_O_ENUM_2, "15.2", [:seq, :_O_ENUM_4, "]"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_O_ENUM_4, "15.4", [:plus, :HEX], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:RANGE, "16", [:seq, "[", :_RANGE_1, "]"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_RANGE_1, "16.1", [:alt, :_RANGE_2, :_RANGE_3], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_RANGE_2, "16.2", [:seq, :R_CHAR, "-", :R_CHAR], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_RANGE_3, "16.3", [:seq, :HEX, "-", :HEX], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:O_RANGE, "17", [:seq, "[^", :_O_RANGE_1, "]"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_O_RANGE_1, "17.1", [:alt, :_O_RANGE_2, :_O_RANGE_3], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_O_RANGE_2, "17.2", [:seq, :R_CHAR, "-", :R_CHAR], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_O_RANGE_3, "17.3", [:seq, :HEX, "-", :HEX], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:STRING1, "18", [:seq, "\"", :_STRING1_1, "\""], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_STRING1_1, "18.1", [:star, :_STRING1_2], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_STRING1_2, "18.2", [:diff, :CHAR, "\""], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:STRING2, "19", [:seq, "'", :_STRING2_1, "'"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_STRING2_1, "19.1", [:star, :_STRING2_2], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_STRING2_2, "19.2", [:diff, :CHAR, "'"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:CHAR, "20", [:alt, :_CHAR_1, :_CHAR_2, :_CHAR_3, :_CHAR_4], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_CHAR_1, "20.1", [:range, "#x9#xA#xD"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_CHAR_2, "20.2", [:range, "#x20-#xD7FF"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_CHAR_3, "20.3", [:range, "#xE000-#xFFFD"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_CHAR_4, "20.4", [:range, "#x10000-#x10FFFF"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:R_CHAR, "21", [:diff, :CHAR, "]"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:POSTFIX, "22", [:range, "?*+"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:PASS, "23", [:plus, :_PASS_1], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_1, "23.1", [:alt, :_PASS_2, :_PASS_3, :_PASS_4, :_PASS_5], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_2, "23.2", [:range, "#x9#xA#xD#x20"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_3, "23.3", [:seq, :_PASS_6, :_PASS_7], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_6, "23.6", [:alt, :_PASS_8, "//"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_8, "23.8", [:diff, "#", "#x"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_7, "23.7", [:star, :_PASS_9], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_9, "23.9", [:range, "^#xA#xD"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_4, "23.4", [:seq, "/*", :_PASS_10, "*/"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_10, "23.10", [:star, :_PASS_11], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_11, "23.11", [:alt, :_PASS_12, :_PASS_13], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_12, "23.12", [:opt, :_PASS_14], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_14, "23.14", [:seq, "*", :_PASS_15], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_15, "23.15", [:range, "^/"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_13, "23.13", [:range, "^*"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_5, "23.5", [:seq, "(*", :_PASS_16, "*)"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_16, "23.16", [:star, :_PASS_17], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_17, "23.17", [:alt, :_PASS_18, :_PASS_19], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_18, "23.18", [:opt, :_PASS_20], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_20, "23.20", [:seq, "*", :_PASS_21], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_21, "23.21", [:range, "^)"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_PASS_19, "23.19", [:range, "^*"], kind: :terminal).extend(EBNF::PEG::Rule),
    EBNF::Rule.new(:_pass, nil, [:seq, :PASS], kind: :pass).extend(EBNF::PEG::Rule),
  ]
end


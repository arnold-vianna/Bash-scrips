# Simulating obfuscation with zero-width space (U+200B)
zwsp = "\u200B"  # Zero-width space character

# Original word
original = "password"
print("Original:", original)  # Displays: password

# Obfuscated word with ZWSP between each character
obfuscated = zwsp.join(original)
print("Obfuscated (visual):", obfuscated)  # Displays: password (looks identical)
print("Obfuscated (raw):", repr(obfuscated))  # Shows: 'p\u200ba\u200bs\u200bs\u200bw\u200bo\u200br\u200bd'

# Simulating a filter
def keyword_filter(text):
    if "password" in text:
        return "Blocked: Contains 'password'"
    return "Allowed"

# Test the filter
print("Filter on original:", keyword_filter(original))  # Blocked: Contains 'password'
print("Filter on obfuscated:", keyword_filter(obfuscated))  # Allowed (since it's not 'password')


int main() {
    // embedded assemble code trigger as warning
    __asm__("invalid_instruction");
    return 0;
}
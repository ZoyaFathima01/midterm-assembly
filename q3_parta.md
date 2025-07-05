## Design and Thought Process

**Goal:**  
Write a program to determine if a number is odd or even, **without using any AND or OR logical instructions**.

**Why Not Use AND/OR?**  
The most common way to check for odd/even is to examine the least significant bit using `AND` or `TEST`, e.g., `test al, 1`. However, since this is not allowed, we must find an alternative.

**Alternative: Use Division and Remainder**  
Instead of logical operations, we can use the fact that:
- Even numbers produce a remainder of 0 when divided by 2.
- Odd numbers produce a remainder of 1 when divided by 2.

In x86 assembly, the `DIV` instruction divides `AX` by a register (e.g., `BL`), placing the remainder in `AH` (for 8-bit division).

**Step-by-Step Approach:**
1. Load the number into `AL`.
2. Clear `AH` to 0 (since `DIV` works on `AX = AH:AL`).
3. Load `2` into a register (e.g., `BL`).
4. Execute `DIV BL`.
5. Check the value in `AH` (the remainder):
   - If `AH == 0`, the number is even.
   - If `AH == 1`, the number is odd.
6. Use `CMP` and conditional jumps (`JE`, `JNE`) to print the result.

**Why This Works:**
- No logical `AND`/`OR` is used.
- Relies only on arithmetic (`DIV`), comparison (`CMP`), and branching.
- Efficient and demonstrates understanding of both assembly and basic number theory.

---

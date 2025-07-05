# Question 2 – K-map Simplification

**Given Boolean Expression:**  
`Y = ab + a'b + ab'`

---

## Step 1: Fill the K-map

| a \ b | 0 | 1 |
|-------|---|---|
| 0     | 0 | 1 |
| 1     | 1 | 1 |

**Explanation:**
- `ab = 1` → a=1, b=1 → cell (1,1)
- `a'b = 1` → a=0, b=1 → cell (0,1)
- `ab' = 1` → a=1, b=0 → cell (1,0)

---

## Step 2: Group the 1s

- Group 1: Row where `a = 1` → covers (1,0) and (1,1) → gives `a`
- Group 2: Column where `b = 1` → covers (0,1) and (1,1) → gives `b`

---

## Final Simplified Expression
Y = a + b

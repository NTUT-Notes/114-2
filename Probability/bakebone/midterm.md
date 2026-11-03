# Probability — Exam Questions

我沒有全部的題目 :D

**5. (15%)** Toss a fair coin 4 times. Let $X$ be a random variable which denotes the number of heads appeared. Then,

- (a) find the probability mass function of $X$.
- (b) find the expected value, $E[X]$, of $X$.
- (c) find the variance, $\mathrm{Var}[X]$, of $X$.

---

**6. (15%)** Let $X$ be a geometric random variable with the success probability $p$ with $1 > p > 0.5$.

- (a) what is $E[X]=$ ?
- (b) If $Y = 2X - 1$, then find the mean of $Y$, $E[Y]=$ ?
- (c) If $g(X) = 2^{X}$. Then, find the expected value of $g(X)$, that is, $E[g(X)]=$ ?

---

**7. (10%)** Let $X$ be a continuous random variable with the probability density function $f(x)$ as follows.

$$
f(x) =
\begin{cases}
a(x+1), & -1 < x < 1 \\[4pt]
0, & \text{otherwise}
\end{cases}
\qquad \text{where } a \text{ is a constant.}
$$

Then

- (a) determine the value of $a$.
- (b) compute the probability $P(X > 0)=$ ?

---

**8. (10%)** Let $X$ be a continuous variable with the probability density function (p.d.f.)

$$
f(x) =
\begin{cases}
0.5, & 1 < x < 3 \\[4pt]
0, & \text{otherwise}
\end{cases}
\qquad \text{Assume that } Y = \frac{1}{X} + 2.
$$

Then,

- (a) compute $P(Y > 2.5)=$ ?
- (b) find the probability density function of $Y$.

---

## 參考答案 (Reference Answers)

### 5.

$X \sim \mathrm{Binomial}(4,\, 0.5)$

**(a)** $P(X=k) = \binom{4}{k}\left(\tfrac12\right)^4 = \dfrac{\binom{4}{k}}{16}$, $k=0,1,2,3,4$

| $k$ | 0 | 1 | 2 | 3 | 4 |
|---|---|---|---|---|---|
| $P(X=k)$ | $\frac{1}{16}$ | $\frac{4}{16}=\frac14$ | $\frac{6}{16}=\frac38$ | $\frac{4}{16}=\frac14$ | $\frac{1}{16}$ |

**(b)**
$$E[X] = np = 4\cdot\tfrac12 = 2$$

**(c)**
$$\mathrm{Var}[X] = np(1-p) = 4\cdot\tfrac12\cdot\tfrac12 = 1$$

---

### 6.

採「$X$ = 直到第一次成功所需的總試驗次數」定義：$P(X=k)=(1-p)^{k-1}p,\ k\ge 1$。題目給 $p>0.5$ 是為了讓 (c) 中的 $2^X$ 期望值收斂。

**(a)**
$$E[X] = \frac{1}{p}$$

**(b)**
$$E[Y] = E[2X-1] = 2E[X]-1 = \frac{2}{p}-1$$

**(c)**
$$E[g(X)] = E\left[2^{X}\right] = \sum_{k=1}^{\infty} 2^{k}(1-p)^{k-1}p = \frac{2p}{1-2(1-p)} = \frac{2p}{2p-1}$$

> 收斂條件：$2(1-p)<1 \iff p>0.5$，與題設一致。
>
> 若採用「$X$ = 第一次成功前的失敗次數」定義，則 $E[X]=\frac{1-p}{p}$、$E[Y]=\frac{2(1-p)}{p}-1$、$E[2^X]=\frac{p}{2p-1}$。作答時建議先寫明採用哪一種定義。

---

### 7.

**(a)** 由 $\int_{-\infty}^{\infty} f(x)\,dx = 1$：

$$\int_{-1}^{1} a(x+1)\,dx = a\left[\frac{x^{2}}{2}+x\right]_{-1}^{1} = a\left[(1.5)-(-0.5)\right] = 2a = 1
\;\Longrightarrow\; \boxed{a=\tfrac12}$$

**(b)**
$$P(X>0) = \int_{0}^{1}\frac{x+1}{2}\,dx = \frac12\left[\frac{x^{2}}{2}+x\right]_{0}^{1} = \frac12\cdot\frac32 = \boxed{\frac34 = 0.75}$$

---

### 8.

$X \sim U(1,3)$，$f_X(x)=\frac12$，$1<x<3$。因 $Y=\frac1X+2$ 在 $X\in(1,3)$ 上遞減，值域為 $\left(\frac73,\,3\right)$。

**(a)**
$$P(Y>2.5) = P\left(\frac1X+2>2.5\right) = P\left(\frac1X>0.5\right) = P(X<2) = \frac{2-1}{3-1} = \boxed{\frac12}$$

**(b)** 先用 CDF 法（$y>2$）：

$$F_Y(y) = P\left(\frac1X+2\le y\right) = P\left(X\ge \frac{1}{y-2}\right) = 1-F_X\!\left(\frac{1}{y-2}\right)$$

微分（或用變數變換 $f_Y(y)=f_X\!\left(\frac{1}{y-2}\right)\left|\frac{d}{dy}\frac{1}{y-2}\right|$）得

$$
f_Y(y)=
\begin{cases}
\dfrac{1}{2\,(y-2)^{2}}, & \dfrac{7}{3} < y < 3 \\[8pt]
0, & \text{otherwise}
\end{cases}
$$

驗證：$\displaystyle\int_{7/3}^{3}\frac{dy}{2(y-2)^{2}} = \frac12\left[-\frac{1}{y-2}\right]_{7/3}^{3} = \frac12(3-1)=1$ ✓

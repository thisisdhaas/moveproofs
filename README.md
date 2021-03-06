# The `moveproofs` Package
A LaTeX package for auto-moving proofs to the appendix of a document.

## Installation
Simply download `moveproofs.sty` from the [latest release](https://github.com/thisisdhaas/moveproofs/releases) in this repository and make sure it is available to your LaTeX compiler (i.e., by placing it in the same folder as your document or by installing it with other system LaTeX packages).

## Package Overview
The `moveproofs` package will let you write your proofs inline with your document, then automatically move them to the appendix.
To use the package:

1. Write down and label theorems:

        \begin{theorem}\label{my_theorem}
            The world is flat.
        \end{theorem}
       
2. Prove your theorems using the `\makeproof` command:

        \makeproof{my_theorem}{
            My worldview does not permit a round Earth.
            Therefore, the world is flat.
        }

3. Include the `moveproofs` package (`\usepackage{moveproofs}`) and alter its options to choose how proofs are displayed:
   * `location = [inline | appendix]`. Controls whether proofs are displayed inline (where you wrote the `\makeproof` command) or in the appendix of the document. This option is required.
   * `appendixsectionname = NAME`. Customizes the name of the appendix section in which proofs are displayed (`Proofs` by default).
   * `prependtoappendix = [true | false]`. Controls whether proofs are inserted before existing appendix sections or after them (`false` by default: proofs are inserted at the end of the appendix).
   * `manual = [true | false]`. If this option is set to `true` and `location = appendix`, proofs will not automatically be inserted in the appendix. Rather, you can control where proofs are inserted with two commands:
     * `\appendixproofsection{Section Name}`: creates a section in the appendix that appears only if `location = appendix`.
     * `\appendixproof{theorem_label}`: Inserts the proof you wrote inside `\makeproof{theorem_label}` (again, only if `location = appendix`).
4. Use the `\appendixproofnotice[MESSAGE]` command to notify readers that proofs will appear in the appendix. Default text (or the replacement text given in the optional `MESSAGE` argument) will appear only if `location = appendix`.

5. If you don't want to autowrap each call to `\makeproof` in a proof environment (for example, because you want to state a helper lemma before proving the theorem), use `\makeproof*` and `\appendixproof*` instead of `\makeproof` and `\appendixproof`. Remember, this means you are responsible for inserting `\begin{proof}` and `\end{proof}` commands.
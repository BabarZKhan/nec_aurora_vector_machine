# nec_aurora_vector_machine

The NEC team has designed a training course on vectorization on the SX-Aurora Tsubasa. This self study course is aimed at beginners with programming on the Aurora as well as advanced users [1] . This repository contains the exercises and solutions of these exercises.

# What is NEC?
NEC Corporation (Nippon Denki Kabushiki-gaisha) is a Japanese multinational information technology and electronics company, headquartered in Minato, Tokyo.  The company was known as the Nippon Electric Company, Limited, before rebranding in 1983 as NEC. It provides IT and network solutions, including cloud computing, AI, IoT platform, and 5G network, to business enterprises, communications services providers and to government agencies, and has also been the biggest PC vendor in Japan since the 1980s, when it launched the PC-8000 series.

# What are Vector Processors?
A vector processor acts on several pieces of data with a single instruction. A superscalar processor issues several instructions at a time, each of which operates on one piece of data. Our MIPS pipelined processor is a scalar processor. Vector processors were popular for supercomputers in the 1980s and 1990s because they efficiently handled the long vectors of data common in scientific computations. Modern high-performance microprocessors are superscalar, because issuing several independent instructions is more flexible than processing vectors. However, modern processors also include hardware to handle short
vectors of data that are common in multimedia and graphics applications. These are called \textbf{single instruction multiple data (SIMD)} units.



# NEC SX Architecture Family
| System and Year            | MAX CPUs      | Peak CPU Double Precision GFLOPS   | Peak System GFLOPS |  Max Main Memory | System Memory |  Memory B/W per CPU (GB/s)
| -------------------------- | ------------- |----------------------------------- | ------------------ | ---------------- |---------------- |---------------- |
| SX-1E (1983)               |  1            |                        |                    |                  |                 |            |
| SX-1  (1983)               |  1            |                        |                    |                  |                 | |
| SX-2  (1983)               |  1            |     1.3                   |                    |                  |                 |
| SX-3  (1990)               |  4            |        5.5                |                    |                  |                 |
| SX-3R  (1992)              |               |                        |                    |                  |                 |
| SX-4  (1990)               |  32           |          2              |                    |                  |                 |
| SX-5  (1998)               |  16           |            8            |                    |                  |                 |
| SX-6 (2001)                |   8           |       8                 |                    |                  |                 |
| SX-6i (2001)               |   1           |                        |                    |                  |                 |
| SX-7 (2002)                |   32          |    8.83                     |    282                |         256 GB         |         1129        | 35.3
| SX-8i (2005)               |               |                        |                    |                  |    32 GB             |
| SX-8R (2006)               |      8        |        35.2                |        281.6            |          256 GB        |     1129            | 35.3
| SX-9 (2007)                |      16       |          102.4              |           1638         |      1 TB            |   4096              | 256
| SX-ACE (2013)              |      1        |         256               |     256               |        1 TB          |   256              | 256
| SX-Aurora TSUBASA (2018)   |      8        |       2450                 |          19600          |   8×48GB               |    8×1200             | 1200


# References

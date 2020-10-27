# ddrfuzz
Fuzzing is the method to detect vulnerabilities of application in invalid inputs or stressful environmental conditions. Genetic algorithm-based fuzzer mutates the seed files to get various inputs, which are then used to trigger potential crashes. Many existing studies proposed the seed generation algorithm, but the current algorithms do not provide better performance than the random generation algorithm. Existing research showed that crash triggered seed files are crucial for fuzzing efficiency, but it was not utilized in many studies. Accordingly, this paper proposes the DDRFuzz, a fuzzing system designed based on a reinforcement learning model to generate valuable seed files. We evaluated the DDRFuzz with American Fuzzy Loop (AFL) on 00 open-source applications with the input formats of mp3, bmp, or flv. The DDRFuzz detected 00 extra unique crashes, 00 extra unique paths for the evaluated 00 applications. From the crashes detected by the DDRFuzz, we discovered 00 new vulnerabilities and received their CVE IDs.

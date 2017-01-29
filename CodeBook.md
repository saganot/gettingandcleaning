# Human Activity Recognition Using Smartphones Dataset - Merged and Cleaned Data
## Codebook - Description of Data, Merging and Cleaning Process, Variables

## Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The data from both the train and test categories has been merged and cleaned using the run_analysis script.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Merging and Cleaning Process

### Original datasets

The following files are contained in the original datasets:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Analysis Process

Using the run_analysis.R script, the following steps have been performed:

1. Reading the files for each of the two datasets separately and merging them into one matrix.
2. Since the measurements in the dataset were not provided as discrete variables but as long strings containing multiple variables, splitting each string into discrete values. For each file in the Inertial Strings directory, each string was split into 128 elements, and for X_test/X_train, each string was split into 561 features. The strings were then discarded.
3. Converting the matrix into a dataframe.
4. Generating variable names based on the original filenames and the features_info.txt file. See below for description of the variables themselves.
5. Matching variable names to columns in the dataframe.
6. Writing the resulting merged and cleaned dataset to a csv file.

## Variables

1. subject_id: a number (1-10) representing the subject for which the measurement was taken. This was taken straight from the subject_train.txt file in each dataset.

2. activity_id: a label describing the activity taken for each measurement: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING. This variable originated from the y_test.txt/y_train.txt file, where it was stored as a number (1-6), and then converted to text label using the information provided in activity_labels.txt.

3-1154. 1152 variables with the name format <filename>_###. <filename> was taken from each of the nine files contained in the Inertial Signals directory, while the number is a running index from 1 to 128. Thus, there is a distinct variable for each of the 128 elements in each of the nine measurements:

- body_acc_x - The body acceleration signal (X axis) obtained by subtracting the gravity from the total acceleration.
- body_acc_y - The body acceleration signal (Y axis) obtained by subtracting the gravity from the total acceleration.
- body_acc_z - The body acceleration signal (Z axis) obtained by subtracting the gravity from the total acceleration.
- body_gyro_x - The angular velocity vector (X axis) measured by the gyroscope for each window sample. 
- body_gyro_y - The angular velocity vector (X axis) measured by the gyroscope for each window sample.
- body_gyro_z - The angular velocity vector (X axis) measured by the gyroscope for each window sample.
- total_acc_x - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.
- total_acc_y - The acceleration signal from the smartphone accelerometer Y axis in standard gravity units 'g'.
- total_acc_z - The acceleration signal from the smartphone accelerometer Z axis in standard gravity units 'g'.

For example, the variable total_acc_x_1 represents the first element of the acceleration signal from the smartphone accelerometer X axis.

1155-1715. 561 variables describing the various features derived from the measurements, as following: 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The full list of variables, derived from features.txt:

1155. tBodyAcc_mean_X
1156. tBodyAcc_mean_Y
1157. tBodyAcc_mean_Z
1158. tBodyAcc_std_X
1159. tBodyAcc_std_Y
1160. tBodyAcc_std_Z
1161. tBodyAcc_mad_X
1162. tBodyAcc_mad_Y
1163. tBodyAcc_mad_Z
1164. tBodyAcc_max_X
1165. tBodyAcc_max_Y
1166. tBodyAcc_max_Z
1167. tBodyAcc_min_X
1168. tBodyAcc_min_Y
1169. tBodyAcc_min_Z
1170. tBodyAcc_sma
1171. tBodyAcc_energy_X
1172. tBodyAcc_energy_Y
1173. tBodyAcc_energy_Z
1174. tBodyAcc_iqr_X
1175. tBodyAcc_iqr_Y
1176. tBodyAcc_iqr_Z
1177. tBodyAcc_entropy_X
1178. tBodyAcc_entropy_Y
1179. tBodyAcc_entropy_Z
1180. tBodyAcc_arCoeff_X_1
1181. tBodyAcc_arCoeff_X_2
1182. tBodyAcc_arCoeff_X_3
1183. tBodyAcc_arCoeff_X_4
1184. tBodyAcc_arCoeff_Y_1
1185. tBodyAcc_arCoeff_Y_2
1186. tBodyAcc_arCoeff_Y_3
1187. tBodyAcc_arCoeff_Y_4
1188. tBodyAcc_arCoeff_Z_1
1189. tBodyAcc_arCoeff_Z_2
1190. tBodyAcc_arCoeff_Z_3
1191. tBodyAcc_arCoeff_Z_4
1192. tBodyAcc_correlation_X_Y
1193. tBodyAcc_correlation_X_Z
1194. tBodyAcc_correlation_Y_Z
1195. tGravityAcc_mean_X
1196. tGravityAcc_mean_Y
1197. tGravityAcc_mean_Z
1198. tGravityAcc_std_X
1199. tGravityAcc_std_Y
1200. tGravityAcc_std_Z
1201. tGravityAcc_mad_X
1202. tGravityAcc_mad_Y
1203. tGravityAcc_mad_Z
1204. tGravityAcc_max_X
1205. tGravityAcc_max_Y
1206. tGravityAcc_max_Z
1207. tGravityAcc_min_X
1208. tGravityAcc_min_Y
1209. tGravityAcc_min_Z
1210. tGravityAcc_sma
1211. tGravityAcc_energy_X
1212. tGravityAcc_energy_Y
1213. tGravityAcc_energy_Z
1214. tGravityAcc_iqr_X
1215. tGravityAcc_iqr_Y
1216. tGravityAcc_iqr_Z
1217. tGravityAcc_entropy_X
1218. tGravityAcc_entropy_Y
1219. tGravityAcc_entropy_Z
1220. tGravityAcc_arCoeff_X_1
1221. tGravityAcc_arCoeff_X_2
1222. tGravityAcc_arCoeff_X_3
1223. tGravityAcc_arCoeff_X_4
1224. tGravityAcc_arCoeff_Y_1
1225. tGravityAcc_arCoeff_Y_2
1226. tGravityAcc_arCoeff_Y_3
1227. tGravityAcc_arCoeff_Y_4
1228. tGravityAcc_arCoeff_Z_1
1229. tGravityAcc_arCoeff_Z_2
1230. tGravityAcc_arCoeff_Z_3
1231. tGravityAcc_arCoeff_Z_4
1232. tGravityAcc_correlation_X_Y
1233. tGravityAcc_correlation_X_Z
1234. tGravityAcc_correlation_Y_Z
1235. tBodyAccJerk_mean_X
1236. tBodyAccJerk_mean_Y
1237. tBodyAccJerk_mean_Z
1238. tBodyAccJerk_std_X
1239. tBodyAccJerk_std_Y
1240. tBodyAccJerk_std_Z
1241. tBodyAccJerk_mad_X
1242. tBodyAccJerk_mad_Y
1243. tBodyAccJerk_mad_Z
1244. tBodyAccJerk_max_X
1245. tBodyAccJerk_max_Y
1246. tBodyAccJerk_max_Z
1247. tBodyAccJerk_min_X
1248. tBodyAccJerk_min_Y
1249. tBodyAccJerk_min_Z
1250. tBodyAccJerk_sma
1251. tBodyAccJerk_energy_X
1252. tBodyAccJerk_energy_Y
1253. tBodyAccJerk_energy_Z
1254. tBodyAccJerk_iqr_X
1255. tBodyAccJerk_iqr_Y
1256. tBodyAccJerk_iqr_Z
1257. tBodyAccJerk_entropy_X
1258. tBodyAccJerk_entropy_Y
1259. tBodyAccJerk_entropy_Z
1260. tBodyAccJerk_arCoeff_X_1
1261. tBodyAccJerk_arCoeff_X_2
1262. tBodyAccJerk_arCoeff_X_3
1263. tBodyAccJerk_arCoeff_X_4
1264. tBodyAccJerk_arCoeff_Y_1
1265. tBodyAccJerk_arCoeff_Y_2
1266. tBodyAccJerk_arCoeff_Y_3
1267. tBodyAccJerk_arCoeff_Y_4
1268. tBodyAccJerk_arCoeff_Z_1
1269. tBodyAccJerk_arCoeff_Z_2
1270. tBodyAccJerk_arCoeff_Z_3
1271. tBodyAccJerk_arCoeff_Z_4
1272. tBodyAccJerk_correlation_X_Y
1273. tBodyAccJerk_correlation_X_Z
1274. tBodyAccJerk_correlation_Y_Z
1275. tBodyGyro_mean_X
1276. tBodyGyro_mean_Y
1277. tBodyGyro_mean_Z
1278. tBodyGyro_std_X
1279. tBodyGyro_std_Y
1280. tBodyGyro_std_Z
1281. tBodyGyro_mad_X
1282. tBodyGyro_mad_Y
1283. tBodyGyro_mad_Z
1284. tBodyGyro_max_X
1285. tBodyGyro_max_Y
1286. tBodyGyro_max_Z
1287. tBodyGyro_min_X
1288. tBodyGyro_min_Y
1289. tBodyGyro_min_Z
1290. tBodyGyro_sma
1291. tBodyGyro_energy_X
1292. tBodyGyro_energy_Y
1293. tBodyGyro_energy_Z
1294. tBodyGyro_iqr_X
1295. tBodyGyro_iqr_Y
1296. tBodyGyro_iqr_Z
1297. tBodyGyro_entropy_X
1298. tBodyGyro_entropy_Y
1299. tBodyGyro_entropy_Z
1300. tBodyGyro_arCoeff_X_1
1301. tBodyGyro_arCoeff_X_2
1302. tBodyGyro_arCoeff_X_3
1303. tBodyGyro_arCoeff_X_4
1304. tBodyGyro_arCoeff_Y_1
1305. tBodyGyro_arCoeff_Y_2
1306. tBodyGyro_arCoeff_Y_3
1307. tBodyGyro_arCoeff_Y_4
1308. tBodyGyro_arCoeff_Z_1
1309. tBodyGyro_arCoeff_Z_2
1310. tBodyGyro_arCoeff_Z_3
1311. tBodyGyro_arCoeff_Z_4
1312. tBodyGyro_correlation_X_Y
1313. tBodyGyro_correlation_X_Z
1314. tBodyGyro_correlation_Y_Z
1315. tBodyGyroJerk_mean_X
1316. tBodyGyroJerk_mean_Y
1317. tBodyGyroJerk_mean_Z
1318. tBodyGyroJerk_std_X
1319. tBodyGyroJerk_std_Y
1320. tBodyGyroJerk_std_Z
1321. tBodyGyroJerk_mad_X
1322. tBodyGyroJerk_mad_Y
1323. tBodyGyroJerk_mad_Z
1324. tBodyGyroJerk_max_X
1325. tBodyGyroJerk_max_Y
1326. tBodyGyroJerk_max_Z
1327. tBodyGyroJerk_min_X
1328. tBodyGyroJerk_min_Y
1329. tBodyGyroJerk_min_Z
1330. tBodyGyroJerk_sma
1331. tBodyGyroJerk_energy_X
1332. tBodyGyroJerk_energy_Y
1333. tBodyGyroJerk_energy_Z
1334. tBodyGyroJerk_iqr_X
1335. tBodyGyroJerk_iqr_Y
1336. tBodyGyroJerk_iqr_Z
1337. tBodyGyroJerk_entropy_X
1338. tBodyGyroJerk_entropy_Y
1339. tBodyGyroJerk_entropy_Z
1340. tBodyGyroJerk_arCoeff_X_1
1341. tBodyGyroJerk_arCoeff_X_2
1342. tBodyGyroJerk_arCoeff_X_3
1343. tBodyGyroJerk_arCoeff_X_4
1344. tBodyGyroJerk_arCoeff_Y_1
1345. tBodyGyroJerk_arCoeff_Y_2
1346. tBodyGyroJerk_arCoeff_Y_3
1347. tBodyGyroJerk_arCoeff_Y_4
1348. tBodyGyroJerk_arCoeff_Z_1
1349. tBodyGyroJerk_arCoeff_Z_2
1350. tBodyGyroJerk_arCoeff_Z_3
1351. tBodyGyroJerk_arCoeff_Z_4
1352. tBodyGyroJerk_correlation_X_Y
1353. tBodyGyroJerk_correlation_X_Z
1354. tBodyGyroJerk_correlation_Y_Z
1355. tBodyAccMag_mean
1356. tBodyAccMag_std
1357. tBodyAccMag_mad
1358. tBodyAccMag_max
1359. tBodyAccMag_min
1360. tBodyAccMag_sma
1361. tBodyAccMag_energy
1362. tBodyAccMag_iqr
1363. tBodyAccMag_entropy
1364. tBodyAccMag_arCoeff1
1365. tBodyAccMag_arCoeff2
1366. tBodyAccMag_arCoeff3
1367. tBodyAccMag_arCoeff4
1368. tGravityAccMag_mean
1369. tGravityAccMag_std
1370. tGravityAccMag_mad
1371. tGravityAccMag_max
1372. tGravityAccMag_min
1373. tGravityAccMag_sma
1374. tGravityAccMag_energy
1375. tGravityAccMag_iqr
1376. tGravityAccMag_entropy
1377. tGravityAccMag_arCoeff1
1378. tGravityAccMag_arCoeff2
1379. tGravityAccMag_arCoeff3
1380. tGravityAccMag_arCoeff4
1381. tBodyAccJerkMag_mean
1382. tBodyAccJerkMag_std
1383. tBodyAccJerkMag_mad
1384. tBodyAccJerkMag_max
1385. tBodyAccJerkMag_min
1386. tBodyAccJerkMag_sma
1387. tBodyAccJerkMag_energy
1388. tBodyAccJerkMag_iqr
1389. tBodyAccJerkMag_entropy
1390. tBodyAccJerkMag_arCoeff1
1391. tBodyAccJerkMag_arCoeff2
1392. tBodyAccJerkMag_arCoeff3
1393. tBodyAccJerkMag_arCoeff4
1394. tBodyGyroMag_mean
1395. tBodyGyroMag_std
1396. tBodyGyroMag_mad
1397. tBodyGyroMag_max
1398. tBodyGyroMag_min
1399. tBodyGyroMag_sma
1400. tBodyGyroMag_energy
1401. tBodyGyroMag_iqr
1402. tBodyGyroMag_entropy
1403. tBodyGyroMag_arCoeff1
1404. tBodyGyroMag_arCoeff2
1405. tBodyGyroMag_arCoeff3
1406. tBodyGyroMag_arCoeff4
1407. tBodyGyroJerkMag_mean
1408. tBodyGyroJerkMag_std
1409. tBodyGyroJerkMag_mad
1410. tBodyGyroJerkMag_max
1411. tBodyGyroJerkMag_min
1412. tBodyGyroJerkMag_sma
1413. tBodyGyroJerkMag_energy
1414. tBodyGyroJerkMag_iqr
1415. tBodyGyroJerkMag_entropy
1416. tBodyGyroJerkMag_arCoeff1
1417. tBodyGyroJerkMag_arCoeff2
1418. tBodyGyroJerkMag_arCoeff3
1419. tBodyGyroJerkMag_arCoeff4
1420. fBodyAcc_mean_X
1421. fBodyAcc_mean_Y
1422. fBodyAcc_mean_Z
1423. fBodyAcc_std_X
1424. fBodyAcc_std_Y
1425. fBodyAcc_std_Z
1426. fBodyAcc_mad_X
1427. fBodyAcc_mad_Y
1428. fBodyAcc_mad_Z
1429. fBodyAcc_max_X
1430. fBodyAcc_max_Y
1431. fBodyAcc_max_Z
1432. fBodyAcc_min_X
1433. fBodyAcc_min_Y
1434. fBodyAcc_min_Z
1435. fBodyAcc_sma
1436. fBodyAcc_energy_X
1437. fBodyAcc_energy_Y
1438. fBodyAcc_energy_Z
1439. fBodyAcc_iqr_X
1440. fBodyAcc_iqr_Y
1441. fBodyAcc_iqr_Z
1442. fBodyAcc_entropy_X
1443. fBodyAcc_entropy_Y
1444. fBodyAcc_entropy_Z
1445. fBodyAcc_maxInds_X
1446. fBodyAcc_maxInds_Y
1447. fBodyAcc_maxInds_Z
1448. fBodyAcc_meanFreq_X
1449. fBodyAcc_meanFreq_Y
1450. fBodyAcc_meanFreq_Z
1451. fBodyAcc_skewness_X
1452. fBodyAcc_kurtosis_X
1453. fBodyAcc_skewness_Y
1454. fBodyAcc_kurtosis_Y
1455. fBodyAcc_skewness_Z
1456. fBodyAcc_kurtosis_Z
1457. fBodyAcc_bandsEnergy_1_8
1458. fBodyAcc_bandsEnergy_9_16
1459. fBodyAcc_bandsEnergy_17_24
1460. fBodyAcc_bandsEnergy_25_32
1461. fBodyAcc_bandsEnergy_33_40
1462. fBodyAcc_bandsEnergy_41_48
1463. fBodyAcc_bandsEnergy_49_56
1464. fBodyAcc_bandsEnergy_57_64
1465. fBodyAcc_bandsEnergy_1_16
1466. fBodyAcc_bandsEnergy_17_32
1467. fBodyAcc_bandsEnergy_33_48
1468. fBodyAcc_bandsEnergy_49_64
1469. fBodyAcc_bandsEnergy_1_24
1470. fBodyAcc_bandsEnergy_25_48
1471. fBodyAcc_bandsEnergy_1_8
1472. fBodyAcc_bandsEnergy_9_16
1473. fBodyAcc_bandsEnergy_17_24
1474. fBodyAcc_bandsEnergy_25_32
1475. fBodyAcc_bandsEnergy_33_40
1476. fBodyAcc_bandsEnergy_41_48
1477. fBodyAcc_bandsEnergy_49_56
1478. fBodyAcc_bandsEnergy_57_64
1479. fBodyAcc_bandsEnergy_1_16
1480. fBodyAcc_bandsEnergy_17_32
1481. fBodyAcc_bandsEnergy_33_48
1482. fBodyAcc_bandsEnergy_49_64
1483. fBodyAcc_bandsEnergy_1_24
1484. fBodyAcc_bandsEnergy_25_48
1485. fBodyAcc_bandsEnergy_1_8
1486. fBodyAcc_bandsEnergy_9_16
1487. fBodyAcc_bandsEnergy_17_24
1488. fBodyAcc_bandsEnergy_25_32
1489. fBodyAcc_bandsEnergy_33_40
1490. fBodyAcc_bandsEnergy_41_48
1491. fBodyAcc_bandsEnergy_49_56
1492. fBodyAcc_bandsEnergy_57_64
1493. fBodyAcc_bandsEnergy_1_16
1494. fBodyAcc_bandsEnergy_17_32
1495. fBodyAcc_bandsEnergy_33_48
1496. fBodyAcc_bandsEnergy_49_64
1497. fBodyAcc_bandsEnergy_1_24
1498. fBodyAcc_bandsEnergy_25_48
1499. fBodyAccJerk_mean_X
1500. fBodyAccJerk_mean_Y
1501. fBodyAccJerk_mean_Z
1502. fBodyAccJerk_std_X
1503. fBodyAccJerk_std_Y
1504. fBodyAccJerk_std_Z
1505. fBodyAccJerk_mad_X
1506. fBodyAccJerk_mad_Y
1507. fBodyAccJerk_mad_Z
1508. fBodyAccJerk_max_X
1509. fBodyAccJerk_max_Y
1510. fBodyAccJerk_max_Z
1511. fBodyAccJerk_min_X
1512. fBodyAccJerk_min_Y
1513. fBodyAccJerk_min_Z
1514. fBodyAccJerk_sma
1515. fBodyAccJerk_energy_X
1516. fBodyAccJerk_energy_Y
1517. fBodyAccJerk_energy_Z
1518. fBodyAccJerk_iqr_X
1519. fBodyAccJerk_iqr_Y
1520. fBodyAccJerk_iqr_Z
1521. fBodyAccJerk_entropy_X
1522. fBodyAccJerk_entropy_Y
1523. fBodyAccJerk_entropy_Z
1524. fBodyAccJerk_maxInds_X
1525. fBodyAccJerk_maxInds_Y
1526. fBodyAccJerk_maxInds_Z
1527. fBodyAccJerk_meanFreq_X
1528. fBodyAccJerk_meanFreq_Y
1529. fBodyAccJerk_meanFreq_Z
1530. fBodyAccJerk_skewness_X
1531. fBodyAccJerk_kurtosis_X
1532. fBodyAccJerk_skewness_Y
1533. fBodyAccJerk_kurtosis_Y
1534. fBodyAccJerk_skewness_Z
1535. fBodyAccJerk_kurtosis_Z
1536. fBodyAccJerk_bandsEnergy_1_8
1537. fBodyAccJerk_bandsEnergy_9_16
1538. fBodyAccJerk_bandsEnergy_17_24
1539. fBodyAccJerk_bandsEnergy_25_32
1540. fBodyAccJerk_bandsEnergy_33_40
1541. fBodyAccJerk_bandsEnergy_41_48
1542. fBodyAccJerk_bandsEnergy_49_56
1543. fBodyAccJerk_bandsEnergy_57_64
1544. fBodyAccJerk_bandsEnergy_1_16
1545. fBodyAccJerk_bandsEnergy_17_32
1546. fBodyAccJerk_bandsEnergy_33_48
1547. fBodyAccJerk_bandsEnergy_49_64
1548. fBodyAccJerk_bandsEnergy_1_24
1549. fBodyAccJerk_bandsEnergy_25_48
1550. fBodyAccJerk_bandsEnergy_1_8
1551. fBodyAccJerk_bandsEnergy_9_16
1552. fBodyAccJerk_bandsEnergy_17_24
1553. fBodyAccJerk_bandsEnergy_25_32
1554. fBodyAccJerk_bandsEnergy_33_40
1555. fBodyAccJerk_bandsEnergy_41_48
1556. fBodyAccJerk_bandsEnergy_49_56
1557. fBodyAccJerk_bandsEnergy_57_64
1558. fBodyAccJerk_bandsEnergy_1_16
1559. fBodyAccJerk_bandsEnergy_17_32
1560. fBodyAccJerk_bandsEnergy_33_48
1561. fBodyAccJerk_bandsEnergy_49_64
1562. fBodyAccJerk_bandsEnergy_1_24
1563. fBodyAccJerk_bandsEnergy_25_48
1564. fBodyAccJerk_bandsEnergy_1_8
1565. fBodyAccJerk_bandsEnergy_9_16
1566. fBodyAccJerk_bandsEnergy_17_24
1567. fBodyAccJerk_bandsEnergy_25_32
1568. fBodyAccJerk_bandsEnergy_33_40
1569. fBodyAccJerk_bandsEnergy_41_48
1570. fBodyAccJerk_bandsEnergy_49_56
1571. fBodyAccJerk_bandsEnergy_57_64
1572. fBodyAccJerk_bandsEnergy_1_16
1573. fBodyAccJerk_bandsEnergy_17_32
1574. fBodyAccJerk_bandsEnergy_33_48
1575. fBodyAccJerk_bandsEnergy_49_64
1576. fBodyAccJerk_bandsEnergy_1_24
1577. fBodyAccJerk_bandsEnergy_25_48
1578. fBodyGyro_mean_X
1579. fBodyGyro_mean_Y
1580. fBodyGyro_mean_Z
1581. fBodyGyro_std_X
1582. fBodyGyro_std_Y
1583. fBodyGyro_std_Z
1584. fBodyGyro_mad_X
1585. fBodyGyro_mad_Y
1586. fBodyGyro_mad_Z
1587. fBodyGyro_max_X
1588. fBodyGyro_max_Y
1589. fBodyGyro_max_Z
1590. fBodyGyro_min_X
1591. fBodyGyro_min_Y
1592. fBodyGyro_min_Z
1593. fBodyGyro_sma
1594. fBodyGyro_energy_X
1595. fBodyGyro_energy_Y
1596. fBodyGyro_energy_Z
1597. fBodyGyro_iqr_X
1598. fBodyGyro_iqr_Y
1599. fBodyGyro_iqr_Z
1600. fBodyGyro_entropy_X
1601. fBodyGyro_entropy_Y
1602. fBodyGyro_entropy_Z
1603. fBodyGyro_maxInds_X
1604. fBodyGyro_maxInds_Y
1605. fBodyGyro_maxInds_Z
1606. fBodyGyro_meanFreq_X
1607. fBodyGyro_meanFreq_Y
1608. fBodyGyro_meanFreq_Z
1609. fBodyGyro_skewness_X
1610. fBodyGyro_kurtosis_X
1611. fBodyGyro_skewness_Y
1612. fBodyGyro_kurtosis_Y
1613. fBodyGyro_skewness_Z
1614. fBodyGyro_kurtosis_Z
1615. fBodyGyro_bandsEnergy_1_8
1616. fBodyGyro_bandsEnergy_9_16
1617. fBodyGyro_bandsEnergy_17_24
1618. fBodyGyro_bandsEnergy_25_32
1619. fBodyGyro_bandsEnergy_33_40
1620. fBodyGyro_bandsEnergy_41_48
1621. fBodyGyro_bandsEnergy_49_56
1622. fBodyGyro_bandsEnergy_57_64
1623. fBodyGyro_bandsEnergy_1_16
1624. fBodyGyro_bandsEnergy_17_32
1625. fBodyGyro_bandsEnergy_33_48
1626. fBodyGyro_bandsEnergy_49_64
1627. fBodyGyro_bandsEnergy_1_24
1628. fBodyGyro_bandsEnergy_25_48
1629. fBodyGyro_bandsEnergy_1_8
1630. fBodyGyro_bandsEnergy_9_16
1631. fBodyGyro_bandsEnergy_17_24
1632. fBodyGyro_bandsEnergy_25_32
1633. fBodyGyro_bandsEnergy_33_40
1634. fBodyGyro_bandsEnergy_41_48
1635. fBodyGyro_bandsEnergy_49_56
1636. fBodyGyro_bandsEnergy_57_64
1637. fBodyGyro_bandsEnergy_1_16
1638. fBodyGyro_bandsEnergy_17_32
1639. fBodyGyro_bandsEnergy_33_48
1640. fBodyGyro_bandsEnergy_49_64
1641. fBodyGyro_bandsEnergy_1_24
1642. fBodyGyro_bandsEnergy_25_48
1643. fBodyGyro_bandsEnergy_1_8
1644. fBodyGyro_bandsEnergy_9_16
1645. fBodyGyro_bandsEnergy_17_24
1646. fBodyGyro_bandsEnergy_25_32
1647. fBodyGyro_bandsEnergy_33_40
1648. fBodyGyro_bandsEnergy_41_48
1649. fBodyGyro_bandsEnergy_49_56
1650. fBodyGyro_bandsEnergy_57_64
1651. fBodyGyro_bandsEnergy_1_16
1652. fBodyGyro_bandsEnergy_17_32
1653. fBodyGyro_bandsEnergy_33_48
1654. fBodyGyro_bandsEnergy_49_64
1655. fBodyGyro_bandsEnergy_1_24
1656. fBodyGyro_bandsEnergy_25_48
1657. fBodyAccMag_mean
1658. fBodyAccMag_std
1659. fBodyAccMag_mad
1660. fBodyAccMag_max
1661. fBodyAccMag_min
1662. fBodyAccMag_sma
1663. fBodyAccMag_energy
1664. fBodyAccMag_iqr
1665. fBodyAccMag_entropy
1666. fBodyAccMag_maxInds
1667. fBodyAccMag_meanFreq
1668. fBodyAccMag_skewness
1669. fBodyAccMag_kurtosis
1670. fBodyBodyAccJerkMag_mean
1671. fBodyBodyAccJerkMag_std
1672. fBodyBodyAccJerkMag_mad
1673. fBodyBodyAccJerkMag_max
1674. fBodyBodyAccJerkMag_min
1675. fBodyBodyAccJerkMag_sma
1676. fBodyBodyAccJerkMag_energy
1677. fBodyBodyAccJerkMag_iqr
1678. fBodyBodyAccJerkMag_entropy
1679. fBodyBodyAccJerkMag_maxInds
1680. fBodyBodyAccJerkMag_meanFreq
1681. fBodyBodyAccJerkMag_skewness
1682. fBodyBodyAccJerkMag_kurtosis
1683. fBodyBodyGyroMag_mean
1684. fBodyBodyGyroMag_std
1685. fBodyBodyGyroMag_mad
1686. fBodyBodyGyroMag_max
1687. fBodyBodyGyroMag_min
1688. fBodyBodyGyroMag_sma
1689. fBodyBodyGyroMag_energy
1690. fBodyBodyGyroMag_iqr
1691. fBodyBodyGyroMag_entropy
1692. fBodyBodyGyroMag_maxInds
1693. fBodyBodyGyroMag_meanFreq
1694. fBodyBodyGyroMag_skewness
1695. fBodyBodyGyroMag_kurtosis
1696. fBodyBodyGyroJerkMag_mean
1697. fBodyBodyGyroJerkMag_std
1698. fBodyBodyGyroJerkMag_mad
1699. fBodyBodyGyroJerkMag_max
1700. fBodyBodyGyroJerkMag_min
1701. fBodyBodyGyroJerkMag_sma
1702. fBodyBodyGyroJerkMag_energy
1703. fBodyBodyGyroJerkMag_iqr
1704. fBodyBodyGyroJerkMag_entropy
1705. fBodyBodyGyroJerkMag_maxInds
1706. fBodyBodyGyroJerkMag_meanFreq
1707. fBodyBodyGyroJerkMag_skewness
1708. fBodyBodyGyroJerkMag_kurtosis
1709. angletBodyAccMean_gravity
1710. angletBodyAccJerkMean_gravityMean
1711. angle(tBodyGyroMean_gravityMean
1712. angle(tBodyGyroJerkMean_gravityMean
1713. angleX_gravityMean
1714. angleY_gravityMean
1715. angleZ_gravityMean


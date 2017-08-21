for i in $(seq 6000 1000 20001)
do
  cp ~/dawn-benchmark/tensorflow_qa/bi-att-flow/out/basic/00/save/checkpoint_bak ~/dawn-benchmark/tensorflow_qa/bi-att-flow/out/basic/00/save/checkpoint
  sed -i "s/basic-20000/basic-${i}/g" ~/dawn-benchmark/tensorflow_qa/bi-att-flow/out/basic/00/save/checkpoint
  echo  i
  if [ $i -gt 9000 ]
  then
    python3 -m basic.cli --len_opt --cluster
    python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/test-0${i}.json
  else
    python3 -m basic.cli --len_opt --cluster
    python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/test-00${i}.json
  fi
done
#echo "DEV 8000"
#cp ~/benchmark/dawn-benchmark/tensorflow_qa/bi-att-flow/out/basic/00/answer/backup/
#python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/dev-008000.json
#echo "DEV 9000"
#python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/dev-009000.json
#echo "DEV 10000"
#python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/dev-010000.json
#echo "DEV 11000"
#python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/dev-011000.json
#echo "DEV 12000"
#python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/dev-012000.json
#echo "DEV 13000"
#python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/dev-013000.json
#echo "DEV 14000"
#python squad/evaluate-v1.1.py data/squad/dev-v1.1.json out/basic/00/answer/dev-014000.json

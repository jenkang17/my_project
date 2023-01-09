<!-- TEXT -->
<p class="text-box text-center py-3 px-2 mb-4">
    &#8251; 수표 입금 시 입금처리되지 않습니다.
</p>
<!-- //TEXT -->

<!-- FORM -->
<form name="exchangeFrm" id="exchangeFrm" action="#" method="POST">
    <input type="hidden" name="mode" value="exchange">
    <input type="hidden" name="checkpw" value="">
    <div class="table-box">
        <table class="table-style1">
            <colgroup>
                <col width="15%">
                <col>
            </colgroup>
            <tr>
                <th>보유머니</th>
                <td>
                    <input type="text" name="myMoney" class="form-control u-money" readonly>
                </td>
            </tr>
            <tr>
                <th>출금신청 금액</th>
                <td>
                    <input type="text" name="requestMoney" class="form-control request-money" value="0" readonly>
                    <div class="moeny-btn-box mt-2">
                        <button type="button" class="btn-outline-danger btn" value="10000" onclick="addMoney2(10000);">1만원</button>
                        <button type="button" class="btn-outline-danger btn" value="50000"  onclick="addMoney2(50000);"> 5만원</button>
                        <button type="button" class="btn-outline-danger btn" value="100000"  onclick="addMoney2(100000);">10만원</button>
                        <button type="button" class="btn-outline-danger btn" value="500000"  onclick="addMoney2(500000);">50만원</button>
                        <button type="button" class="btn-outline-danger btn" value="1000000"  onclick="addMoney2(1000000);">100만원</button>
                        <button type="button" class="btn-outline-danger btn" onclick="resetMoney2();">Clear</button>
                    </div>
                </td>
            </tr>
            <tr>
                <th>출금자명</th>
                <td><input type="text" class="form-control" readonly value="홍길동"></td>
            </tr>
            <tr class="exchange-pw">
                <th>출금 비밀번호</th>
                <td>
                    <input type="password" name="exchangePw" class="form-control" maxlength="20">
                    <button type="button" class="btn-secondary btn btn-sm" onclick="checkPw();">비밀번호 확인</button>
                </td>
            </tr>
        </table>
    </div>
    <p class="text-box text-center py-3 px-2 mt-5">
        입금자명과 출금자명이 다를 경우 본인확인 요청이 있을 수 있습니다.<br><br>

        [주의사항] 하단 내용을 꼭 확인해 주세요!<br>

        1. 환전하고자 하는 금액을 입력후 환전신청 버튼을 클릭하면 환전처리됩니다<br>
        2. 24시간 입출금이 가능하며 최장 10분가량 소요됩니다.<br>
        (※23:30~00:30분 까지는 은행 점검으로 인해 타행 이체불가)<br>
        3. 10분이상 입금이 지연될시 회원님 계좌정보를 잘못 기입한 경우가 많습니다.<br>
        출금금액은 최소 3만원부터 1만원 단위로 가능합니다.
    </p>
    <div class="btn-box text-center mt-4">
        <button type="button" class="btn-dark btn" onclick="exchange();">출금신청</button>
    </div>
</form>
<!-- //FORM -->

<!-- LIST -->
<div class="table-box mt-5">
    <table class="table-style2">
        <colgroup>
            <col width="22%">
            <col width="18%">
            <col width="24%">
            <col width="20%">
            <col width="16%">
        </colgroup>
        <thead>
            <tr>
                <th>출금금액</th>
                <th>출금명</th>
                <th>출금일자</th>
                <th>상태</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>100,000원</td>
                <td>홍길동</td>
                <td>2022-11-05 5:08:27</td>
                <td style="color:#000">처리완료</td>
                <td><a href="#" class="btn-delete">삭제</a></td>
            </tr>
            <tr>
                <td>100,000원</td>
                <td>홍길동</td>
                <td>2022-11-05 5:08:27</td>
                <td style="color:#d01b30">취소</td>
                <td><a href="#" class="btn-delete">삭제</a></td>
            </tr>
            <tr>
                <td>100,000원</td>
                <td>홍길동</td>
                <td>2022-11-05 5:08:27</td>
                <td style="color:#3f51b5">처리중</td>
                <td><a href="#" class="btn-delete">삭제</a></td>
            </tr>
        </tbody>
    </table>
    <div class="btn-box text-center py-4">
        <button type="button" class="btn-light btn btn-sm" value="500000">더보기</button>
    </div>
</div>
<!-- //LIST -->